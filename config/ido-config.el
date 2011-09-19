;; Interactively do things
(require 'ido)
(require 'recentf)

;; ido settings
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode 1)

(defun ido-find-tag ()
  "Find a tag using ido"
  (interactive)
  (tags-reset-tags-tables)
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
	    (unless (integerp x)
	      (push (prin1-to-string x t) tag-names)))
	  tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))
 
;; (defun ido-find-file-in-tag-files ()
;;   (interactive)
;;   (tags-reset-tags-tables)
;;   (tags-completion-table)
;;   (save-excursion
;;     (let ((enable-recursive-minibuffers t))
;;       (visit-tags-table-buffer))
;;     (find-file
;;      (expand-file-name
;;       (ido-completing-read
;;        "Project file: " (tags-table-files) nil t)))))

(defun ido-find-file-in-tag-files ()
  "Uses the current tags table to construct a list of files in the project, and use ido-completing-read
to present the choices. Handles duplicate file names by appending the name of the first different directory
name for the two files, moving up the directory tree step by step."
  (interactive)
  (tags-reset-tags-tables)
  (tags-completion-table)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (setq tbl (make-hash-table :test 'equal))
    (let (ido-list)
      (mapc (lambda (path)
	      ;; format path for display in ido list, by default displaying the parent directory of the file
	      (setq key (replace-regexp-in-string "\\(.*?\\)\\([^/]+\\)/\\([^/]+?\\)$" "\\3" path))
	      ;; remove trailing | or /
	      (setq key (replace-regexp-in-string "\\(|\\|/\\)$" "" key))

              (if (gethash key tbl)
                  ;; Key already exists in the table, we need to uniquify them
                  (let* ((old-path (gethash key tbl))
                         (old-path-tmp (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\1" old-path))
                         (new-path-tmp (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\1" path))
                         unique-name-old
                         unique-name-new)
                      (setq unique-name-old
                            (replace-regexp-in-string "\\(.*?\\)\\([^/]+\\)/\\([^/]+?\\)$" "\\3:" path)
                            unique-name-new
                            (replace-regexp-in-string "\\(.*?\\)\\([^/]+\\)/\\([^/]+?\\)$" "\\3:" path))
                      ;; Keep adding directories to the keys until they differentiate
                      (while (string-equal unique-name-old unique-name-new)
                        (setq unique-name-old
                              (concat
                               (car (split-string unique-name-old ":"))
                               ":"
                               (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\2" old-path-tmp)
                               )
                              old-path-tmp
                              (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\1" old-path-tmp)
                              unique-name-new
                              (concat
                               (car (split-string unique-name-new ":"))
                               ":"
                               (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\2" new-path-tmp)
                               )
                              new-path-tmp
                              (replace-regexp-in-string "\\(.*?\\)/\\([^/]+?\\)$" "\\1" new-path-tmp)))
                      (remhash key tbl)
                      (puthash unique-name-old old-path tbl)
                      (puthash unique-name-new path tbl)
                      (setq ido-list (delete key ido-list))
                      (push unique-name-old ido-list)
                      (push unique-name-new ido-list))
                ;; Key does not exist in the table, free to push it in
                (puthash key path tbl)
                (push key ido-list))
	      )
	    (tags-table-files)
	    )
      (find-file (gethash (ido-completing-read "project-files: " ido-list) tbl)))))

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
 
;; enable recent files mode.
(recentf-mode t)
 
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)
 
(defun ido-recentf-open ()
  "With `ido-completing-read' look for all recent files"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(global-set-key (kbd "C-.") 'ido-find-file-in-tag-files)

(defvar ido-enable-replace-completing-read t
  "If t, use ido-completing-read instead of completing-read if possible.
    
    Set it to nil using let in around-advice for functions where the
    original completing-read is required.  For example, if a function
    foo absolutely must use the original completing-read, define some
    advice like this:
    
    (defadvice foo (around original-completing-read-only activate)
      (let (ido-enable-replace-completing-read) ad-do-it))")

;; Replace completing-read wherever possible, unless directed otherwise
(defadvice completing-read
  (around use-ido-when-possible activate)
  (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
          (and (boundp 'ido-cur-list)
               ido-cur-list)) ; Avoid infinite loop from ido calling this
      ad-do-it
    (let ((allcomp (all-completions "" collection predicate)))
      (if allcomp
          (setq ad-return-value
                (ido-completing-read prompt
                                     allcomp
                                     nil require-match initial-input hist def))
        ad-do-it))))

;; The completing-read advice seems to have issues with tramp,
;; it will only offer 'dummy' as the prompt on remote machines.
;; Simply overriding that advice for ido-find-file seems to resolve this issue.
(defadvice ido-find-file (around original-completing-read-only activate)
      (let (ido-enable-replace-completing-read) ad-do-it))

;; ibuffer sorting
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("org" (mode . org-mode))
               ("shell" (mode . shell-mode))
               ("mason" (name . "\\.mi?\\|^dhandler\\|^autohandler\\|^html"))
               ("java" (mode . java-mode))
               ("git" (name . "^\\*magit:"))
               ("dired" (mode . dired-mode))
               ("elisp" (mode . emacs-lisp-mode))
               ("output" (or
                          (mode . compilation-mode)
                          (mode . grep-mode)
                          (name . "^\\*Shell Command Output\\*$")))
               ("ruby" (mode . ruby-mode))
               ("xml" (mode . nxml-mode))
               ("perl" (or 
                        (mode . cperl-mode)))
               ("tags" (mode . tags-table-mode))
               ("erc" (mode . erc-mode))
               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))
             )
      )

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; SMEX
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x. (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

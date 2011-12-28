;; Interactively do things
(require 'ido)
(require 'recentf)

;; ido settings
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode 1)

;; Ido minibuffer keybindings
(defun mbeenen-ido-minibuffer-setup ()
  (define-key ido-file-completion-map (kbd "C-w") 'ido-delete-backward-updir))

(add-hook 'ido-minibuffer-setup-hook 'mbeenen-ido-minibuffer-setup)

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

;; 50 files ought to be enough.
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
               ("dired" (mode . dired-mode))
               ("mason" (name . "\\.mi?\\|^dhandler\\|^autohandler\\|^html"))
               ("java" (mode . java-mode))
               ("config" (mode . conf-unix-mode))
               ("xml" (mode . nxml-mode))
               ("git" (name . "^\\*magit:"))
               ("elisp" (mode . emacs-lisp-mode))
               ("output" (or
                          (mode . compilation-mode)
                          (mode . grep-mode)
                          (name . "^\\*Shell Command Output\\*$")))
               ("ruby" (mode . ruby-mode))
               ("perl" (or
                        (mode . cperl-mode)
                        (mode . perl-mode)))
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

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

;; SMEX
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)

(provide 'mbeenen-ido)

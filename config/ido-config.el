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
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
	    (unless (integerp x)
	      (push (prin1-to-string x t) tag-names)))
	  tags-completion-table)
    (find-tag (ido-completing-read "Tag: " tag-names))))
 
(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t))
      (visit-tags-table-buffer))
    (find-file
     (expand-file-name
      (ido-completing-read
       "Project file: " (tags-table-files) nil t)))))

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

;;(global-set-key [remap find-tag] 'ido-find-tag)
(global-set-key (kbd "C-.") 'ido-find-file-in-tag-files)
(global-set-key (kbd "M-i") 'ido-goto-symbol)

;; ibuffer sorting
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("shell" (mode . shell-mode))
               ("perl" (or 
                        (mode . cperl-mode)
                        (mode . mmm-mode)))
               ("java" (mode . jde-mode))
               ("output" (or
                          (mode . compilation-mode)
                          (mode . grep-mode)
                          (name . "^\\*Shell Command Output\\*$")))
               ("ruby" (mode . ruby-mode))
               ("xml" (mode . nxml-mode))
               ("org" (mode . org-mode))
               ("elisp" (mode . emacs-lisp-mode))
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

;; ;; commented out because it was causing bugs with tramp
;; ;; sort ido filelist by mtime instead of alphabetically
;;   (add-hook 'ido-make-file-list-hook 'ido-sort-mtime)
;;   (add-hook 'ido-make-dir-list-hook 'ido-sort-mtime)
;;   (defun ido-sort-mtime ()
;;     (if (not (string-equal ido-current-directory "/"))
;; 	(setq ido-temp-list
;; 	      (sort ido-temp-list 
;; 		    (lambda (a b)
;; 		      (let ((ta (nth 5 (file-attributes (concat ido-current-directory a))))
;; 			    (tb (nth 5 (file-attributes (concat ido-current-directory b)))))
;; 			(if (= (nth 0 ta) (nth 0 tb))
;; 			    (> (nth 1 ta) (nth 1 tb))
;; 			  (> (nth 0 ta) (nth 0 tb)))))))
;;       (ido-to-end  ;; move . files to end (again)
;;        (delq nil (mapcar
;; 		  (lambda (x) (if (string-equal (substring x 0 1) ".") x))
;; 		  ido-temp-list)))))

;; ;; commented out because it was causing bugs with tramp
;; (defvar ido-enable-replace-completing-read t
;;   "If t, use ido-completing-read instead of completing-read if possible.
    
;;     Set it to nil using let in around-advice for functions where the
;;     original completing-read is required.  For example, if a function
;;     foo absolutely must use the original completing-read, define some
;;     advice like this:
    
;;     (defadvice foo (around original-completing-read-only activate)
;;       (let (ido-enable-replace-completing-read) ad-do-it))")

;; ;; Replace completing-read wherever possible, unless directed otherwise
;; (defadvice completing-read
;;   (around use-ido-when-possible activate)
;;   (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
;;           (and (boundp 'ido-cur-list)
;;                ido-cur-list)) ; Avoid infinite loop from ido calling this
;;       ad-do-it
;;     (let ((allcomp (all-completions "" collection predicate)))
;;       (if allcomp
;;           (setq ad-return-value
;;                 (ido-completing-read prompt
;;                                      allcomp
;;                                      nil require-match initial-input hist def))
;;         ad-do-it))))

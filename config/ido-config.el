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
 
(defun ido-find-file-in-tag-files ()
  (interactive)
  (tags-reset-tags-tables)
  (tags-completion-table)
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
               ("org" (mode . org-mode))
               ("shell" (mode . shell-mode))
               ("mason" (name . "\\.mi?\\|dhandler\\|autohandler\\|html"))
               ("java" (mode . jde-mode))
               ("dired" (mode . dired-mode))
               ("output" (or
                          (mode . compilation-mode)
                          (mode . grep-mode)
                          (name . "^\\*Shell Command Output\\*$")))
               ("ruby" (mode . ruby-mode))
               ("xml" (mode . nxml-mode))
               ("perl" (or 
                        (mode . cperl-mode)))
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


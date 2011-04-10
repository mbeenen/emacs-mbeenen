;; this function finds all directories containing files whose names
;; match regexp starting with starting-dir
(require 'find-lisp)
(defun find-dirs-containing (starting-dir regexp)                                                                
  (delete-duplicates (mapcar 'file-name-directory                                                                
                             (find-lisp-find-files starting-dir regexp))))

;; Enable dired-x
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))


;; Buffer menu sorting
(setq Buffer-menu-sort-column 2)

(defun mbeenen-dired-keybindings ()
  (define-key dired-mode-map (kbd "C-c f") 'dired-mark-files-regexp)
  (define-key dired-mode-map (kbd "C-c g") 'dired-mark-files-containing-regexp)
  (define-key dired-mode-map (kbd "C-c q") 'dired-do-query-replace-regexp)
)

(add-hook 'dired-mode-hook 'mbeenen-dired-keybindings)
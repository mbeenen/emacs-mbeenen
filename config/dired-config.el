;; Enable dired-x
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(defun dired-mode-keybindings ()
  (define-key dired-mode-map (kbd "C-c f") 'dired-mark-files-regexp)
  (define-key dired-mode-map (kbd "C-c g") 'dired-mark-files-containing-regexp)
  (define-key dired-mode-map (kbd "C-c q") 'dired-do-query-replace-regexp))

(add-hook 'dired-mode-hook 'dired-mode-keybindings)

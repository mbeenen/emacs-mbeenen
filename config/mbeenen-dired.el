;; Make dired less verbose
(require 'dired-details+)
(setq-default dired-details-hidden-string "--- ")

;; Always reload dired after creating a directory
(defadvice dired-create-directory (after revert-buffer-after-create)
  (revert-buffer))
(ad-activate 'dired-create-directory)

;; Enable dired-x
(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(defun dired-mode-keybindings ()
  (define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)
  (define-key dired-mode-map (kbd "C-c f") 'dired-mark-files-regexp)
  (define-key dired-mode-map (kbd "C-c g") 'dired-mark-files-containing-regexp)
  (define-key dired-mode-map (kbd "C-c q") 'dired-do-query-replace-regexp))

(add-hook 'dired-mode-hook 'dired-mode-keybindings)

;; function to start dired in a given directory, with buffer name name
(defun init-dired (starting-dir name)
  (dired starting-dir)
  (rename-buffer name))

;; Dired single and related code causes ^ and [Return] to not spawn a
;; new buffer in Dired, but rather reuse the existing one.
(require 'dired-single)

(defun dired-single-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
        loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer "..")))))

(add-hook 'dired-mode-hook 'dired-single-init)

(provide 'mbeenen-dired)

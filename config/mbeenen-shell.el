;; Emacs shell working directory tracking
  (defun track-shell-directory/procfs ()
    (shell-dirtrack-mode 0)
    (add-hook 'comint-preoutput-filter-functions
              (lambda (str)
                (prog1 str
                  (when (string-match comint-prompt-regexp str)
                    (cd (file-symlink-p
                         (format "/proc/%s/cwd" (process-id
                                                 (get-buffer-process
                                                  (current-buffer)))))))))
              nil t))

(defun add-mode-line-dirtrack ()
  (add-to-list 'mode-line-buffer-identification
               '(:propertize (" " default-directory " ") face dired-directory)))
(add-hook 'shell-mode-hook 'add-mode-line-dirtrack)
(add-hook 'eshell-mode-hook 'add-mode-line-dirtrack)
(setq eshell-prompt-function (lambda nil (concat (if (= (user-uid) 0) " # " "$ "))))

;; function to start a shell in a given dir, and rename the shell
(defun init-shell (starting-dir name)
  (switch-to-buffer "*scratch*")
  (cd starting-dir)
  (shell)
  (rename-buffer name)
  (bury-buffer "*scratch*"))

(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map
              (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)))

(defun shell-clear ()
  (interactive)
  (erase-buffer)
  (comint-send-input))

;; shell shortcuts
(define-key shell-mode-map (kbd "C-c e") 'shell-clear)

;; Allow putting common shell directories into a stored list
(defvar saved-shells (make-hash-table))

(defun mbeenen-visit-shell ()
  (interactive)
  (let (ido-list)
    (maphash (lambda (key value)
               (push key ido-list)) saved-shells)
    (let (chosen-key)
      (setq chosen-key (ido-completing-read "shell: " ido-list))
      (visit-or-create-shell chosen-key)
      )))

(defun visit-or-create-shell (buffer-name)
  (if (not (get-buffer buffer-name))
      (progn
        (init-shell (gethash buffer-name saved-shells) buffer-name))
    (switch-to-buffer buffer-name)))

(provide 'mbeenen-shell)

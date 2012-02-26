;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

(defun mbeenen-home-java-run (prompt)
  "Execute the current java file"
  (interactive "P")
  (let ((args (if prompt
                   (read-string "CLI args: "))))
    (shell-command
     (concat "java -cp \".:/home/michael/projects/thinking-in-java\" "
             (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))
             " " args))))

;; but not for java mode
(defun mbeenen-home-java-setup ()

  (message "in home setup")
  (make-local-variable 'electric-pair-mode)
  (make-local-variable 'electric-indent-mode)
  (make-local-variable 'electric-layout-mode)
  (make-local-variable 'compile-command)

  (setq electric-pair-mode nil)
  (setq electric-indent-mode nil)
  (setq electric-layout-mode nil)
  (setq compile-command (concat "javac -cp \".:/home/michael/projects/thinking-in-java\" "
                                (file-name-nondirectory (buffer-file-name))))

  (define-key java-mode-map (kbd "C-q C-j") 'mbeenen-home-java-run)

  )

(add-hook 'java-mode-hook 'mbeenen-home-java-setup)

(provide 'mbeenen-emacs-24-specific)

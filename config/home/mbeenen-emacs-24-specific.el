;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

(defun mbeenen-home-java-run (prompt)
  "Execute the current java file"
  (interactive "P")
  (let ((args (if prompt
                  (read-string "CLI args: ")))
        (path (mapconcat 'identity (nthcdr
               5 (split-string (file-name-sans-extension (buffer-file-name)) "/")) "/")))
    (shell-command
     (concat "cd /home/michael/projects/thinking-in-java; "
             "java -cp \".:/home/michael/projects/thinking-in-java\" "
             path ;;(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))
             " " args))))

;; but not for java mode
(defun mbeenen-home-java-setup ()

  (make-local-variable 'compile-command)
  (setq compile-command (concat "javac -cp \".:/home/michael/projects/thinking-in-java\" "
                                (file-name-nondirectory (buffer-file-name))))

  (define-key java-mode-map (kbd "C-q C-j") 'mbeenen-home-java-run)

  )

(add-hook 'java-mode-hook 'mbeenen-home-java-setup)

(provide 'mbeenen-emacs-24-specific)

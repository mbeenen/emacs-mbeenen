;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;; but not for java mode
(defun mbeenen-home-java-setup ()

  (message "in home setup")
  (make-local-variable 'electric-pair-mode)
  (make-local-variable 'electric-indent-mode)
  (make-local-variable 'electric-layout-mode)

  (setq electric-pair-mode nil)
  (setq electric-indent-mode nil)
  (setq electric-layout-mode nil)

  )

(add-hook 'java-mode-hook 'mbeenen-home-java-setup)

(provide 'mbeenen-emacs-24-specific)

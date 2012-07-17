(load (concat emacs-site-lisp-dir "nxhtml/autostart.el"))

;; More estentions to associate to Mason
(add-to-list 'auto-mode-alist '("\\.mi?\\'"    . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\dhandler\\'"    . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\autohandler\\'"    . mason-nxhtml-mumamo-mode))

(provide 'mbeenen-nxhtml)

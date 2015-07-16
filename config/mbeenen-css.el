(setq css-indent-offset 4)

(add-to-list 'auto-mode-alist '("\\.\\(scss\\|css\\)$" . scss-mode))

;; Override SCSS trying to compile on save (Brazil takes care of this for me)
(setq scss-compile-at-save nil)

(add-hook 'css-mode-hook 'mbeenen-prog-mode-hook)

(provide 'mbeenen-css)

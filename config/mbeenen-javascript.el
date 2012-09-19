(setq js-indent-level 2)
(autoload 'js2-mode "js2-mode" nil t)

(add-hook 'js2-mode-hook 'mbeenen-prog-mode-hook)
(add-hook 'js-mode-hook 'mbeenen-prog-mode-hook)

(provide 'mbeenen-javascript)

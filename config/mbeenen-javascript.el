(setq js-indent-level 2)
(autoload 'js2-mode "js2-mode" nil t)

(add-hook 'js2-mode-hook 'mbeenen-prog-mode-hook)
(add-hook 'js-mode-hook 'mbeenen-prog-mode-hook)

(require 'js-comint)

(setq inferior-js-program-command "nodejs")
 
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)))))

(provide 'mbeenen-javascript)

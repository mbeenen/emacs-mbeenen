(require 'mmm-mode)

(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.m\\'"  'mason)
(mmm-add-mode-ext-class 'html-mode "\\.mi\\'" 'mason)

(provide 'mbeenen-mmm)

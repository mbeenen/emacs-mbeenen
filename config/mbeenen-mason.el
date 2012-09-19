;; Extensions for which we may have mason code and use mmm
(add-to-list 'auto-mode-alist '("\\.mi?$" . html-mode))
(add-to-list 'auto-mode-alist '("^html$" . html-mode))
(add-to-list 'auto-mode-alist '("dhandler" . html-mode))
(add-to-list 'auto-mode-alist '("autohandler" . html-mode))
(add-to-list 'auto-mode-alist '("javascript.mi$" . html-mode))
(add-to-list 'auto-mode-alist '("js\\.mi?" . js-mode))
(add-to-list 'auto-mode-alist '("\\javascript\\.mi?" . js-mode))
(add-to-list 'auto-mode-alist '("css\\.mi?" . css-mode))

;; Basic mason components (html/perl)
(mmm-add-mode-ext-class 'html-mode "\\.m\\'"  'mason)
(mmm-add-mode-ext-class 'html-mode "\\.mi\\'" 'mason)

;; Additional files which should use mason mode
(mmm-add-mode-ext-class 'html-mode "dhandler"  'mason)
(mmm-add-mode-ext-class 'html-mode "autohandler" 'mason)

;; Setup mason mode for mixed javascript files
(mmm-add-mode-ext-class 'js-mode "js\\.mi\\'"  'mason)
(mmm-add-mode-ext-class 'js-mode "\\.js\\.m\\'"  'mason)
(mmm-add-mode-ext-class 'js-mode "\\.js\\.mi\\'"  'mason)
(mmm-add-mode-ext-class 'js-mode "javascript\\.m\\'"  'mason)
(mmm-add-mode-ext-class 'js-mode "\\.mi$"  'mason)

;; Setup mason mode for mixed css files
(mmm-add-mode-ext-class 'css-mode "css\\.mi\\'"  'mason)
(mmm-add-mode-ext-class 'css-mode "\\.css\\.m\\'"  'mason)
(mmm-add-mode-ext-class 'css-mode "\\.css\\.mi\\'"  'mason)

(add-hook 'html-mode-hook 'mbeenen-prog-mode-hook)


(provide 'mbeenen-mason)

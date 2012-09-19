;; Extensions for which we may want to run mason mode
(add-to-list 'auto-mode-alist '("\\.mi?$" . html-mode))
(add-to-list 'auto-mode-alist '("^html$" . html-mode))
(add-to-list 'auto-mode-alist '("dhandler" . html-mode))
(add-to-list 'auto-mode-alist '("autohandler" . html-mode))
(add-to-list 'auto-mode-alist '("javascript.mi$" . html-mode))

(provide 'mbeenen-mason)

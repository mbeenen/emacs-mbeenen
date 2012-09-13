;; Extensions for which we may want to run mason mode
(add-to-list 'auto-mode-alist '("\\.mi?$" . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("html" . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("dhandler" . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("autohandler" . mason-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("javascript.mi" . mason-nxhtml-mumamo-mode))

(provide 'mbeenen-mason)

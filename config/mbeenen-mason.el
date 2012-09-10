;; Extensions for which we may want to run mason mode
(setq auto-mode-alist (cons '("\\.mi?$" . mason-nxhtml-mumamo-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("html" . mason-nxhtml-mumamo-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("dhandler" . mason-nxhtml-mumamo-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("autohandler" . mason-nxhtml-mumamo-mode) auto-mode-alist))

(provide 'mbeenen-mason)

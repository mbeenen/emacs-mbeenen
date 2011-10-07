(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(setq auto-mode-alist (cons '("\\.emacs$" . emacs-lisp-mode) auto-mode-alist))

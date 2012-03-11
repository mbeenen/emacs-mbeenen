(require 'yasnippet)
(yas/initialize)

;; Prompt with an ido-style prompt for keys with multiple expansions
(setq yas/prompt-functions '(yas/ido-prompt))

;; Setup my snippets directory
(setq yas/root-directory (list
                          emacs-snippet-dir))
(yas/reload-all)
(yas/global-mode t)

(add-hook 'yas/after-exit-snippet-hook 'indent-for-tab-command)

(defun snippet-mode-setup ()
  (make-local-variable 'require-final-newline)
  (setq require-final-newline nil))

(add-hook 'snippet-mode-hook 'snippet-mode-setup)
(provide 'mbeenen-yasnippet)

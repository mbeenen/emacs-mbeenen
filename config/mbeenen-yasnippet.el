(require 'yasnippet)
(yas/initialize)

;; Prompt with an ido-style prompt for keys with multiple expansions
(setq yas/prompt-functions '(yas/ido-prompt))

;; Setup my snippets directory
(setq yas/root-directory (concat root-dir "snippets"))
(yas/load-directory yas/root-directory)

(yas/global-mode t)

(provide 'mbeenen-yasnippet)

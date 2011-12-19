(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/initialize)

;; Prompt with an ido-style prompt for keys with multiple expansions
(setq yas/prompt-functions '(yas/ido-prompt))

;; Setup my snippets directory
(setq yas/root-directory "~/projects/emacs-mbeenen/mysnippets")
(yas/load-directory yas/root-directory)

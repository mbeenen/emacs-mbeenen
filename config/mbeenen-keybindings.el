;; Setup my custom keymap to Ctrl-z, unbind the default as well
(global-set-key (kbd "C-z") nil)
(define-prefix-command 'mbeenen-custom-map)
(global-set-key (kbd "C-z") 'mbeenen-custom-map)
;; My custom keybindings
(define-key mbeenen-custom-map (kbd "c") 'compile)
(define-key mbeenen-custom-map (kbd "g") 'grep)
(define-key mbeenen-custom-map (kbd "r") 'recompile)
(define-key mbeenen-custom-map (kbd "s") 'shell)
(define-key mbeenen-custom-map (kbd "i") 'ido-goto-symbol)
(define-key mbeenen-custom-map (kbd "v") 'revert-buffer)
(define-key mbeenen-custom-map (kbd "b") 'rename-buffer)
(define-key mbeenen-custom-map (kbd "q") 'query-replace-regexp)
(define-key mbeenen-custom-map (kbd "m") 'magit-status)
(define-key mbeenen-custom-map (kbd "u") 'run-unit-test)
(define-key mbeenen-custom-map (kbd "C-u") 'run-unit-test-with-logging)
(define-key mbeenen-custom-map (kbd "f") 'ifind-mode-current-directory)
(define-key mbeenen-custom-map (kbd "/") 'comment-or-uncomment-region)
(define-key mbeenen-custom-map (kbd "p") 'grep-o-matic-repository)
(define-key mbeenen-custom-map (kbd "C-p") 'grep-o-matic-current-directory)
(define-key mbeenen-custom-map (kbd "t") 'ido-find-tag)
(define-key mbeenen-custom-map (kbd "d") 'find-name-dired)
(define-key mbeenen-custom-map (kbd "e") 'mbeenen-erc-start-or-switch)

;; get off the backspace key
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; etags-select key bindings
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

;; Compilation buffer type commands
(global-set-key "\M-k" 'next-error)
(global-set-key "\M-l" 'previous-error)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
;; Always indent on return
(global-set-key (kbd "RET") 'newline-and-indent)

;; functions for searching for the word at point in a buffer
(global-set-key (kbd "M-n") 'smart-symbol-go-forward)
(global-set-key (kbd "M-p") 'smart-symbol-go-backward)

;; hippie expand
(global-set-key "\M-/" 'hippie-expand)

;; SMEX
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(provide 'mbeenen-keybindings)
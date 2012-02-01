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
(define-key mbeenen-custom-map (kbd "u") 'run-unit-test)
(define-key mbeenen-custom-map (kbd "C-u") 'run-unit-test-with-logging)
(define-key mbeenen-custom-map (kbd "f") 'ifind-mode-current-directory)
(define-key mbeenen-custom-map (kbd "/") 'comment-or-uncomment-region)
(define-key mbeenen-custom-map (kbd "p") 'grep-o-matic-repository)
(define-key mbeenen-custom-map (kbd "C-p") 'grep-o-matic-current-directory)
(define-key mbeenen-custom-map (kbd "t") 'ido-find-tag)
(define-key mbeenen-custom-map (kbd "d") 'find-name-dired)
(define-key mbeenen-custom-map (kbd "e") 'mbeenen-erc-start-or-switch)

;; file finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)

;; move more quickly
(global-set-key (kbd "C-e") 'move-end-of-line-or-next-line)
(global-set-key (kbd "C-a") 'move-start-of-line-or-prev-line)

;; Delete region (don't put it in the kill-ring)
(global-set-key (kbd "C-c C-w") 'delete-region)

;; Yank and indent
(global-set-key (kbd "C-S-y") 'yank-indented)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; get off the backspace key
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "C-S-d") 'delete-backward-char)

;; Get rid of bury buffer shortcut
(global-set-key (kbd "<C-tab>") nil)

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

;; Magit
(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)

;;Ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(provide 'mbeenen-keybindings)

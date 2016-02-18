;; Setup my custom keymap to Ctrl-z, unbind the default as well
(global-set-key (kbd "C-z") nil)
(define-prefix-command 'mbeenen-custom-map)
(global-set-key (kbd "C-z") 'mbeenen-custom-map)

;; My custom keybindings
(define-key mbeenen-custom-map (kbd "c") 'compile)
(define-key mbeenen-custom-map (kbd "g") 'grep-o-matic-current-directory)
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
(define-key mbeenen-custom-map (kbd "C-p") 'grep-o-matic-parent-repository)
(define-key mbeenen-custom-map (kbd "t") 'ido-find-tag)
(define-key mbeenen-custom-map (kbd "d") 'find-name-dired)
(define-key mbeenen-custom-map (kbd "SPC") 'just-one-space)
(define-key mbeenen-custom-map (kbd "y") 'yas-insert-snippet)
(define-key mbeenen-custom-map (kbd "h") 'mbeenen-visit-shell)

;; file finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)
(global-set-key (kbd "C-.") 'projectile-find-file)

;; move more quickly
(global-set-key (kbd "C-e") 'move-end-of-line-or-next-line)
(global-set-key (kbd "C-a") 'move-start-of-line-or-prev-line)

;; newline editing
(global-set-key (kbd "<C-return>") 'new-line-below)
(global-set-key (kbd "<C-S-return>") 'new-line-above)
(global-set-key [(control shift up)] 'prelude-move-line-up)
(global-set-key [(control shift down)] 'prelude-move-line-down)
;; join line
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Delete region (don't put it in the kill-ring)
(global-set-key (kbd "C-c C-w") 'delete-region)

;; Yank and indent
(global-set-key (kbd "C-S-y") 'yank-indented)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; get off the backspace key
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-k" 'kill-region)
(global-set-key "\C-x\C-k" 'kill-line)
(global-set-key "\C-c\C-k" 'kill-line)
(global-set-key (kbd "C-S-d") 'delete-backward-char)

;; Get rid of bury buffer shortcut
(global-set-key (kbd "<C-tab>") nil)

;; Sudo commands
(global-set-key (kbd "M-@") 'sudo-shell-command)

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

;; SMEX (Ido-based M-x)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(define-key magit-status-mode-map (kbd "C-x C-k") 'magit-kill-file-on-line)

;; Secondary keybinding map
(global-set-key (kbd "C-q") nil)
(define-prefix-command 'mbeenen-secondary-map)
(global-set-key (kbd "C-q") 'mbeenen-secondary-map)
(global-set-key (kbd "C-q C-q") 'quoted-insert)

(define-key mbeenen-secondary-map (kbd "s") 'prelude-swap-windows)

;; Recall-position
(define-key mbeenen-secondary-map (kbd "C-r") 'remember-buffer-pos)
(define-key mbeenen-secondary-map (kbd "C-s") 'recall-buffer-pos)

;; Projectile project commands
(define-key mbeenen-secondary-map (kbd "C-c") 'projectile-compile-project)
(define-key mbeenen-secondary-map (kbd "C-t") 'projectile-test-project)
(define-key mbeenen-secondary-map (kbd "C-x") 'projectile-run-project)

;; expand-region
(global-set-key (kbd "C-@") 'er/expand-region)

;;Ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(global-set-key (kbd "C-x r t") 'inline-string-rectangle)

(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
(global-set-key (kbd "C-M-m") 'mark-more-like-this)

;; isearch keybindings
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;; yasnippet
(global-set-key (kbd "C-,") 'yas/expand)

;; spell correct
(global-set-key (kbd "C-x C-i") 'endless/ispell-word-then-abbrev)

(provide 'mbeenen-keybindings)



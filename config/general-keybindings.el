;; Setup my custom keymap to Ctrl-z, unbind the default as well
(global-set-key (kbd "C-z") nil)
(define-prefix-command 'mbeenen-custom-map)
(global-set-key (kbd "C-z") 'mbeenen-custom-map)
;; My custom keybindings 
(define-key mbeenen-custom-map (kbd "c") 'compile)
(define-key mbeenen-custom-map (kbd "g") 'grep)
(define-key mbeenen-custom-map (kbd "r") 'recompile)
(define-key mbeenen-custom-map (kbd "s") 'shell)
(define-key mbeenen-custom-map (kbd "v") 'revert-buffer)
(define-key mbeenen-custom-map (kbd "b") 'rename-buffer)
(define-key mbeenen-custom-map (kbd "q") 'query-replace)
(define-key mbeenen-custom-map (kbd "m") 'magit-status)
(define-key mbeenen-custom-map (kbd "u") 'run-unit-test)
(define-key mbeenen-custom-map (kbd "f") 'ifind-mode-current-directory)
(define-key mbeenen-custom-map (kbd "/") 'comment-or-uncomment-region)
(define-key mbeenen-custom-map (kbd "p") 'ido-find-file-in-tag-files)
(define-key mbeenen-custom-map (kbd "t") 'ido-find-tag)

;; etags-select key bindings
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)

(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)
;; Always indent on return
(global-set-key (kbd "RET") 'newline-and-indent)

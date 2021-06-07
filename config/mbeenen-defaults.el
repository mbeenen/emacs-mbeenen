;; Modifications to Emacs defaults setup

;; Allow pasting selection outside of Emacs
(setq x-select-enable-clipboard t)

;; Auto refresh buffers
(global-auto-revert-mode 1)
(setq auto-revert-verbose nil)
;; Also auto refresh dired
(setq global-auto-revert-non-file-buffers t)

;; Show keystrokes in progress
(setq echo-keystrokes 0.1)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Move files to trash when deleting
(setq delete-by-moving-to-trash t)

;; Real emacs knights don't use shift to mark things
(setq shift-select-mode nil)

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Don't add unintentional new lines at the end of buffer
(setq next-line-add-newlines nil)

;; Always end a file with a newline
(setq require-final-newline t)

;; Disable backup/autosave
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8 please
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Show active region
(transient-mark-mode 1)
(make-variable-buffer-local 'transient-mark-mode)
(put 'transient-mark-mode 'permanent-local t)
(setq-default transient-mark-mode t)

;; smart indenting and pairing for all
(electric-pair-mode)
(electric-indent-mode)
;; (electric-layout-mode nil)

;; Remove text in active region if inserting text
(delete-selection-mode 1)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; 120 characters is about how many before wrapping (with vertical split)
(setq fill-column 120)

;; Save a list of recent files visited.
(recentf-mode 1)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Keep cursor away from edges when scrolling up/down
(require 'smooth-scrolling)

(require 'repository-root)

;; Add parts of each file's directory to the buffer name if not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")
(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))
;; Root access on local host: /sudo::<path-to-root-owned-file>
;; Root access on remote hosts: /sudo:root@remote-host:<path-to-root-owned-file>

;; auto-completion in minibuffer
(icomplete-mode +1)

(winner-mode t)

;; Always split windows along the y-axis
(setq split-height-threshold nil)
(setq split-width-threshold 180)

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))                                                            

;; For the sanity...
(setq ring-bell-function 'ignore)

;; Sorting
(setq sort-fold-case t)

;; Font size adjustment
(set-frame-font "-*-Menlo-normal-normal-normal-*-15-*-*-*-m-0-iso10646-1")

(provide 'mbeenen-defaults)

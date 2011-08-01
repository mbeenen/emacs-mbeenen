;; Midnight Mode (automated buffer cleanup)
(require 'midnight)
(midnight-delay-set 'midnight-delay "12:00am")
(setq clean-buffer-list-delay-general 1)
(setq clean-buffer-list-kill-never-regexps (quote ("^ \\*Minibuf-.*\\*$" "^dired.*$")))

;; Better naming of buffers with same file name
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; turn on font-lock mode
(global-font-lock-mode t)

;; Disable backup/autosave
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Always revert files when they change on disk
(global-auto-revert-mode t)

;; No tabs-- use spaces when indenting (doesn't affect Makefiles,
;; does affect text files and code, doesn't affect existing tabs).
;; The use of setq-default means this only affects modes that don't
;; overwrite this setting.
(setq-default indent-tabs-mode nil)
(setq tab-width 2)

;; disable tool-bar/scroll-bar/menu-bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; disable splash screen
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; Fullscreen mode
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))

(global-set-key [f11] 'toggle-fullscreen)

(setq compile-command "brazil-build apollo-pkg")
(setq grep-command "grep -srni ")
(show-paren-mode t)
(setq x-select-enable-clipboard t)
(setq transient-mark-mode t)
(setq compilation-scroll-output t)
(setq next-line-add-newlines t)


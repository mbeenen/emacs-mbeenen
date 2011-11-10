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

;; Highlight matching parens
(show-paren-mode t)

(setq next-line-add-newlines nil)
(setq require-final-newline t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq transient-mark-mode t)
(setq x-select-enable-clipboard t)

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

;; Always use subword-mode (causes keys like \M-f \M-b to operate over individual chunks of camel case words)
(global-subword-mode t)

(mouse-avoidance-mode 'exile)

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

;; (defun setup-grep-context-command ()
;;   "Set local variables if we are in a Brazil build directory.

;; In particular, this function may set `compile-command' to run
;; brazil-build from the package root."
;;   (interactive)
;;   (if (not (file-remote-p default-directory))
;;       (let ((config-path (amz-locate-file-rootwards default-directory "Config" 'file)))
;;         ;; If we have both of these, we're probably in a Brazil directory tree.
;;         (message config-path)
;;         (if config-path
;;             (progn
;;               (setq amz-brazil-package-dir (file-name-directory config-path))
;;               (message amz-brazil-package-dir)
;;               (message default-grep-command)
;;               ;; Brazil-build can use any underlying build system,
;;               ;; so we can't use -C which is specific to "make".
;;               (set (make-local-variable 'grep-command)
;;                    (concat "cd "
;;                            (file-relative-name amz-brazil-package-dir
;;                                                default-directory)
;;                            " ; "
;;                            default-grep-command
;;                            " "))
;;               (message (buffer-local-value 'grep-command (current-buffer))))))))


(setq compile-command "brazil-build apollo-pkg")
(setq grep-command "grep -srni ")
(setq compilation-scroll-output t)


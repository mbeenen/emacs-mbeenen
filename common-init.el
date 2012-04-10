(require 'cl)

(defvar root-dir (file-name-directory load-file-name)
  "The root dir of my Emacs configuration.")
(defvar emacs-config-dir (concat root-dir "config/")
  "This directory houses all of the main configuration.")
(defvar emacs-site-lisp-dir (concat root-dir "site-lisp/")
  "This directory houses other extensions and git submodules")
(defvar emacs-snippet-dir (concat root-dir "snippets/")
  "This directory contains all snippets for yasnippet")

(add-to-list 'load-path emacs-config-dir)
(add-to-list 'load-path emacs-site-lisp-dir)

;; Add external projects to load path
(dolist (project (directory-files emacs-site-lisp-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "mbeenen-custom.el" emacs-config-dir))
(load custom-file)

;; Set some basic defaults
(require 'mbeenen-defaults)

;; Load the main modules
(require 'mbeenen-packages)
(require 'mbeenen-css)
(require 'mbeenen-dired)
(require 'mbeenen-editor)
(require 'mbeenen-erc)
(require 'mbeenen-grep)
(require 'mbeenen-hippie)
(require 'mbeenen-ido)
(require 'mbeenen-keyboard-macros)
(require 'mbeenen-magit)
(require 'mbeenen-midnight)
(require 'mbeenen-programming)
(require 'mbeenen-projectile)
(require 'mbeenen-shell)
(require 'mbeenen-tags)
(require 'mbeenen-ui)
(require 'mbeenen-yasnippet)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" root-dir))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Load any site-lisp that doesn't require much config
(require 'ace-jump-mode)
(require 'css-complete)
(require 'expand-region)
(require 'inline-string-rectangle)
(require 'magithub)
(require 'mark-more-like-this)
(require 'recall-position)
(require 'rename-sgml-tag)

;; Configuration for various programming (or other major) modes
(require 'mbeenen-java)
(require 'mbeenen-javascript)
(require 'mbeenen-org)
(require 'mbeenen-perl)

;; initialize global keybindings and mode mappings
(require 'mbeenen-keybindings)
(require 'mbeenen-mode-mappings)

(provide 'common-init)

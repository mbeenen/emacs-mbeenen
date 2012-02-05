;; Define any home specific variables required for the common initialization
(defvar org-dir "~/emacs/org")

(require 'common-init)

(defvar emacs-home-dir (concat emacs-config-dir "home/")
"This directory houses all the home specific configuration")
(add-to-list 'load-path emacs-home-dir)

;; Any home specific initialization code to run after loading
;; everything else
(require 'mbeenen-home-startup)

;; Desktop loading goes last
(require 'mbeenen-desktop)

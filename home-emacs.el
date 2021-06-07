(require 'common-init)

(defvar emacs-home-dir (concat emacs-config-dir "home/")
"This directory houses all the home specific configuration")
(add-to-list 'load-path emacs-home-dir)

(defvar emacs-work-dir (concat emacs-config-dir "work/")
  "This directory houses all the work specific configuration")

(add-to-list 'load-path emacs-work-dir)

;; Any home specific initialization code to run after loading
;; everything else
(require 'mbeenen-home-init)
(require 'mbeenen-clojure)
(require 'pbcopy)

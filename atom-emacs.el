(require 'common-init)

(defvar emacs-work-dir (concat emacs-config-dir "atom/")
  "This directory houses all the work specific configuration")

(add-to-list 'load-path emacs-work-dir)

;; Any home specific initialization code to run after loading
;; everything else
(require 'mbeenen-atom-init)
(require 'pbcopy)

;; Desktop loading goes last
(require 'mbeenen-desktop)

(require 'common-init)

(defvar emacs-home-dir (concat emacs-config-dir "omnidian/")
"This directory houses all the home specific configuration")
(add-to-list 'load-path emacs-home-dir)

(require 'mbeenen-omnidian-init)
(require 'pbcopy)

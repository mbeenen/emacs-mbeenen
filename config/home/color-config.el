(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ))

;; Load up zenburn color theme
(require 'zenburn)
(zenburn)
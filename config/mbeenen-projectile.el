;; projectile is a project management mode
(require 'projectile)
(projectile-global-mode t)

(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "apollo-overrides")
(add-to-list 'projectile-globally-ignored-directories "site-lisp")

(provide 'mbeenen-projectile)

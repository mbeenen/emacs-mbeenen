;; projectile is a project management mode
(require 'projectile)
(projectile-global-mode t)
(setq projectile-enable-caching t)

(add-to-list 'projectile-globally-ignored-directories "build")
(add-to-list 'projectile-globally-ignored-directories "apollo-overrides")
(add-to-list 'projectile-globally-ignored-directories "site-lisp")
(add-to-list 'projectile-globally-ignored-directories "eclipse-bin")

(provide 'mbeenen-projectile)

(dir-locals
 "/home/mbeenen/projects/thinking-in-java"
 '((nil . (
           (projectile-project-compile-command . "ant build")
           (projectile-project-run-command . "java ${fqcn}")
           ))))


;; (defvar thinking-in-java-root "/home/mbeenen/projects/thinking-in-java"
;;   "Project root for Thinking in Java exercises")
;; (dir-locals-set-class-variables
;;  'thinking-in-java
;;  '((java-mode . (
;;                  ;; List each variable as a cons cell on each line
;;                  (projectile-project-compile-command . "ant build")
;;                  ))))
;; (dir-locals-set-directory-class thinking-in-java-root 'thinking-in-java)


(provide 'mbeenen-home-projects)

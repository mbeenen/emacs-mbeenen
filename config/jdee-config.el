(setq jde-complete-function (quote jde-complete-minibuf))
(setq jde-jdk-registry (quote (("1.6" . "/apollo/env/eclipse/jdk1.6.0/"))))
(setq jde-plugins-directory "/home/mbeenen/emacs/config/jde-plugins")
(setq jde-enable-abbrev-mode nil)
(setq jde-electric-return-p t)

(defun mbeenen-jdee-shortcuts ()
(define-key jde-mode-map "\M-u" nil)
(define-key jde-mode-map "\M-up" 'jde-usages-display-call-tree-for-thing-at-point) ;; p = point
(define-key jde-mode-map "\M-ui" 'jde-usages-display-call-tree-for-specified-class) ;; i = interactive
(define-key jde-mode-map "\M-uc" 'jde-usages-display-call-tree) ;; c = callers

(define-key jde-mode-map "\M-ut" 'jde-usages-display-type-hierarchy) ;; t = types
(define-key jde-mode-map "\M-ur" 'jde-usages-display-subs-implementing-method) ;; r = reimplements
(define-key jde-mode-map "\M-ud" 'jde-usages-display-subs-and-implementers) ;; d = descendants
(define-key jde-mode-map "\M-ua" 'jde-usages-display-superclasses) ;; a = ancestors

(define-key jde-mode-map "\M-un" 'jde-usages-next-pos)
(define-key jde-mode-map "\M-ul" 'jde-usages-locate-class)
(define-key jde-mode-map "\M-um" 'jde-gen-main-method)

)

(add-hook 'jde-mode-hook 'mbeenen-jdee-shortcuts)

;; (global-set-key [(meta n)]  (lambda ()
;;                               (interactive)
;;                               (jde-load-project-file)
;;                               (jde-open-class-source-with-completion)))
(add-to-list 'load-path (expand-file-name "~/src-installs/emacs-eclim/"))
;; only add the vendor path when you want to use the libraries provided with emacs-eclim
(add-to-list 'load-path (expand-file-name "~/src-installs/emacs-eclim/vendor"))
;; use it a hook instead with the java mode

(require 'eclim)
(setq eclim-auto-save t)
;;(global-eclim-mode)

(define-key eclim-mode-map "\C-c\C-f" 'eclim-java-find-declaration)
(define-key eclim-mode-map "\C-c\C-r" 'eclim-java-find-references)
(define-key eclim-mode-map "\C-c\C-i" 'eclim-java-import)

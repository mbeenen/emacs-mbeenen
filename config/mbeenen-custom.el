;; Houses any modifications made through Emacs customization interface
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(enable-local-variables :all)
 '(js2-strict-inconsistent-return-warning nil)
 '(magit-default-tracking-name-function (quote magit-default-tracking-name-branch-only))
 '(mmm-major-mode-preferences (quote ((perl perl-mode) (python python-mode python-mode) (javascript javascript-mode c++-mode) (java jde-mode java-mode c++-mode) (css css-mode c++-mode))))
 '(perl-indent-continued-arguments 4)
 '(perl-indent-parens-as-block t)
 '(projectile-tags-command "ctags -Re --langmap=HTML:.m.mi..dhandler..autohandler,Perl:.t.pm.pl -f %s %s")
 '(repository-root-exhaustive-scan t)
 '(repository-root-force-scan nil)
 '(tls-program (quote ("/apollo/env/envImprovement/bin/openssl s_client -connect %h:%p -no_ssl2 -ign_eof")))
 '(yas/triggers-in-field t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-annotation-face ((t (:foreground "#8cd0d3"))))
 '(cperl-array-face ((t (:foreground "#f0dfaf" :weight bold))))
 '(cperl-hash-face ((t (:foreground "#f0dfaf" :slant italic :weight bold))))
 '(mmm-default-submode-face ((t (:background "#4f4f4f"))))
 '(mumamo-background-chunk-major ((t (:background "#3f3f3f"))) t)
 '(mumamo-background-chunk-submode1 ((t (:background "#4f4f4f"))) t))


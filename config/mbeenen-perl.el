(require 'cperl-mode)
;; Indentation rules
(setq cperl-indent-parens-as-block t)
(setq cperl-indent-level 2)

(set-face-attribute 'cperl-array-face nil
                    :foreground "#f0dfaf")
(set-face-attribute 'cperl-hash-face nil
                    :foreground "#f0dfaf")
(add-hook 'cperl-mode-hook 'prelude-prog-mode-hook)

(provide 'mbeenen-perl)

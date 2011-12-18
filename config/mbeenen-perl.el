(require 'cperl-mode)
;; Indentation rules
(setq cperl-indent-parens-as-block t)

(set-face-attribute 'cperl-array-face nil
                    :foreground "#f0dfaf")
(set-face-attribute 'cperl-hash-face nil
                    :foreground "#f0dfaf"
                    :slant "italic"
                    :weight "bold")


(provide 'mbeenen-perl)

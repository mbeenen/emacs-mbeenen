(require 'cperl-mode)
;; Indentation rules
(setq cperl-indent-parens-as-block t)
(setq cperl-indent-level 4)
(setq perl-indent-level 4)

(set-face-attribute 'cperl-array-face nil
                    :foreground "#f0dfaf")
(set-face-attribute 'cperl-hash-face nil
                    :foreground "#f0dfaf")
(add-hook 'cperl-mode-hook 'mbeenen-prog-mode-hook)

(provide 'mbeenen-perl)

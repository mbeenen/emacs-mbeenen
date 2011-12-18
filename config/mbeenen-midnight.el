;; Midnight Mode (automated buffer cleanup)
(require 'midnight)
(midnight-delay-set 'midnight-delay "12:00am")
(setq clean-buffer-list-delay-general 1)
(setq clean-buffer-list-kill-never-regexps (quote ("^ \\*Minibuf-.*\\*$" "^dired.*$")))

(provide 'mbeenen-midnight)

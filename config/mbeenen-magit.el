(require 'magit)
;; Magit customizations
(set-face-attribute 'magit-diff-add nil
                    :foreground "#8CD0D3")
(set-face-attribute 'magit-diff-del nil
                    :foreground "#CC9393")
(set-face-attribute 'magit-item-highlight nil
                    :background "#4F4F4F")
(set-face-attribute 'magit-log-graph nil
                    :foreground "light green")

(provide 'mbeenen-magit)

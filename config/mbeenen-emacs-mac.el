(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'control)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

;; Set path information relevant to my mac installation
(setq exec-path (append exec-path '("/usr/local/bin")))

(provide 'mbeenen-emacs-mac)


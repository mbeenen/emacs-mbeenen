(defun mbeenen-java-mode-setup ()
  (interactive)
  (c-toggle-auto-newline t))

(setq java-mode-hook (quote (mbeenen-java-mode-setup)))

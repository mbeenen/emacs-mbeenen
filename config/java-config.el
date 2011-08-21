(defun mbeenen-java-mode-setup ()
  (interactive)
  (c-toggle-auto-newline t)
  (setq c-hungry-delete-key t)
  (add-to-list 'c-cleanup-list 'brace-else-brace)
  (add-to-list 'c-cleanup-list 'brace-elseif-brace)
  (add-to-list 'c-cleanup-list 'brace-catch-brace)
  (add-to-list 'c-cleanup-list 'empty-defun-braces)
  (add-to-list 'c-cleanup-list 'comment-close-slash)
)

(setq java-mode-hook (quote (mbeenen-java-mode-setup)))

(set-face-attribute c-annotation-face nil
                    :foreground "#8cd0d3")

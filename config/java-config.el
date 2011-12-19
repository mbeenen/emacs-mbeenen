(require 'java-mode-indent-annotations)

(defun mbeenen-java-mode-setup ()
  (interactive)
  ;; Minor modes
  (c-toggle-auto-newline)
  (setq c-hungry-delete-key t)

  ;; Indentation cleanup
  (add-to-list 'c-cleanup-list 'brace-else-brace)
  (add-to-list 'c-cleanup-list 'brace-elseif-brace)
  (add-to-list 'c-cleanup-list 'brace-catch-brace)
  (add-to-list 'c-cleanup-list 'empty-defun-braces)
  (add-to-list 'c-cleanup-list 'comment-close-slash)

  ;; Indentation setup
  (c-set-offset 'arglist-close 'c-lineup-close-paren)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-cont-nonempty '++)
  (c-set-offset 'func-decl-cont '++)

  (setq tab-width 4)

  ;; Font face customization
  (set-face-attribute c-annotation-face nil
                    :foreground "#8cd0d3")

)

(setq java-mode-hook (quote (mbeenen-java-mode-setup)))


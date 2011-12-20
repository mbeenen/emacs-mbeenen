(defun mbeenen-java-mode-setup ()
  (interactive)
  ;; Minor modes
  (c-toggle-auto-newline 1)
  (setq c-hungry-delete-key t)

  ;; Auto-newline criteria changes
  (add-to-list 'c-hanging-semi&comma-criteria 'c-semi&comma-no-newlines-before-nonblanks)

  ;; Auto-newline cleanup
  (add-to-list 'c-cleanup-list 'brace-else-brace)
  (add-to-list 'c-cleanup-list 'brace-elseif-brace)
  (add-to-list 'c-cleanup-list 'brace-catch-brace)
  (add-to-list 'c-cleanup-list 'empty-defun-braces)
  (add-to-list 'c-cleanup-list 'comment-close-slash)

  ;; Indentation setup
  (c-set-offset 'arglist-close 0) ;;default is c-lineup-close-paren
  (c-set-offset 'arglist-intro '++)
  (c-set-offset 'arglist-cont-nonempty '++)
  (c-set-offset 'inexpr-class 0)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'func-decl-cont 0) ;;default is c-lineup-java-throws, I'm a little concerned about this one
  (c-set-offset 'case-label '+) ;;default is 0

  (setq tab-width 4)

  ;; Font face customization
  (set-face-attribute c-annotation-face nil
                    :foreground "#8cd0d3")
)

(add-hook 'java-mode-hook 'mbeenen-java-mode-setup)
(add-hook 'java-mode-hook 'prelude-prog-mode-hook)

(provide 'mbeenen-java)

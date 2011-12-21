(defconst my-c-style
  '(
    (c-hanging-braces-alist . ((topmost-intro after)
                               (brace-list-open)
                               (brace-entry-open)
                               (statement-cont)
                               (substatement-open after)
                               (block-close . c-snug-do-while)
                               (extern-lang-open after)
                               (namespace-open after)
                               (module-open after)
                               (composition-open after)
                               (inexpr-class-open after)
                               (inexpr-class-close before)
                               (arglist-cont-nonempty)
                               (inline-open after)))
    (c-cleanup-list . (comment-close-slash
                       empty-defun-braces
                       brace-catch-brace
                       brace-elseif-brace
                       brace-else-brace
                       scope-operator))
    (c-offsets-alist . ((inexpr-class . 0)
                        (inexpr-statement . +)
                        (inclass . +)
                        (arglist-cont-nonempty . ++)
                        (arglist-cont c-lineup-gcc-asm-reg 0)
                        (comment-intro c-lineup-knr-region-comment c-lineup-comment)
                        (catch-clause . 0)
                        (else-clause . 0)
                        (do-while-closure . 0)
                        (case-label . +)
                        (substatement . +)
                        (statement-case-intro . +)
                        (statement . 0)
                        (brace-entry-open . 0)
                        (brace-list-entry . 0)
                        (brace-list-intro . +)
                        (brace-list-close . 0)
                        (brace-list-open . 0)
                        (block-close . 0)
                        (block-open . 0)
                        (inher-intro . +)
                        (annotation-var-cont . +)
                        (annotation-top-cont . 0)
                        (topmost-intro . 0)
                        (knr-argdecl . 0)
                        (inline-close . 0)
                        (class-close . 0)
                        (class-open . 0)
                        (defun-block-intro . +)
                        (defun-close . 0)
                        (defun-open . 0)
                        (func-decl-cont . 0)
                        (inher-cont . c-lineup-java-inher)
                        (access-label . 0)
                        (arglist-close . 0)
                        (arglist-intro . ++)
                        (statement-cont . +)
                        (statement-case-open . +)
                        (substatement-label . +)
                        (substatement-open . 0)
                        (statement-block-intro . +)
                        (topmost-intro-cont . +)
                        (inline-open . 0)))
    (c-hanging-semi&comma-criteria c-semi&comma-no-newlines-before-nonblanks
                                   c-semi&comma-inside-parenlist)
    (c-echo-syntactic-information-p t))
  "My cc mode programming style")
(c-add-style "PERSONAL" my-c-style)

(defun mbeenen-java-mode-setup ()
  (interactive)
  ;; Minor modes
  (c-toggle-auto-newline 1)
  (setq c-hungry-delete-key t)

  (c-set-style "PERSONAL")
  ;; ;; (setq c-hanging-braces-alist set-from-style)
  ;; (add-to-list 'c-hanging-braces-alist '(topmost-intro after))
  ;; ;; Auto-newline criteria changes
  ;; (add-to-list 'c-hanging-semi&comma-criteria 'c-semi&comma-no-newlines-before-nonblanks)

  ;; ;; Auto-newline cleanup
  ;; (add-to-list 'c-cleanup-list 'brace-else-brace)
  ;; (add-to-list 'c-cleanup-list 'brace-elseif-brace)
  ;; (add-to-list 'c-cleanup-list 'brace-catch-brace)
  ;; (add-to-list 'c-cleanup-list 'empty-defun-braces)
  ;; (add-to-list 'c-cleanup-list 'comment-close-slash)

  ;; ;; Indentation setup
  ;; (c-set-offset 'arglist-close 0) ;;default is c-lineup-close-paren
  ;; (c-set-offset 'arglist-intro '++)
  ;; (c-set-offset 'arglist-cont-nonempty '++)
  ;; (c-set-offset 'inexpr-class 0)
  ;; (c-set-offset 'substatement-open 0)
  ;; (c-set-offset 'func-decl-cont 0) ;;default is c-lineup-java-throws, I'm a little concerned about this one
  ;; (c-set-offset 'case-label '+) ;;default is 0

  (setq tab-width 4)

  ;; Font face customization
  (set-face-attribute c-annotation-face nil
                      :foreground "#8cd0d3")
  )

(add-hook 'java-mode-hook 'mbeenen-java-mode-setup)
(add-hook 'java-mode-hook 'prelude-prog-mode-hook)

(provide 'mbeenen-java)

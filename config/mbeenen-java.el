;; Style definition setup
(defconst my-c-style
  '(
    (c-hanging-braces-alist . ((topmost-intro after)
                               (defun-open after)
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
                               (class-open after)
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
                        (comment-intro 0) ;;c-lineup-knr-region-comment c-lineup-comment)
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
                        (annotation-var-cont . 0)
                        (annotation-top-cont . 0)
                        (topmost-intro . 0)
                        (knr-argdecl . 0)
                        (inline-close . 0)
                        (class-close . 0)
                        (class-open . 0)
                        (defun-block-intro . +)
                        (defun-close . 0)
                        (defun-open . 0)
                        (func-decl-cont . c-lineup-java-throws)
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
    (c-hanging-semi&comma-criteria c-semi&comma-inside-parenlist)
    (c-echo-syntactic-information-p t))
  "My cc mode programming style")
(c-add-style "PERSONAL" my-c-style)

(defun mbeenen-java-mode-setup ()
  (interactive)
  ;; Minor modes
  (c-toggle-auto-newline 1)
  (setq c-hungry-delete-key t)

  (c-set-style "PERSONAL")

  (setq tab-width 4)

  ;; Font face customization
  (set-face-attribute c-annotation-face nil
                      :foreground "#8cd0d3")
  )

(add-hook 'java-mode-hook 'mbeenen-java-mode-setup)
(add-hook 'java-mode-hook 'mbeenen-prog-mode-hook)

;; UTILITY FUNCTIONS - shortcuts for operations I find myself frequently performing

(defun disable-unit-tests ()
  "Comment out all unit tests in the current buffer"
  (interactive)
  (save-excursion
    (replace-string "void test" "void ttest" nil (point-min) (point-max))
    (replace-string "@Test" "//@Test" nil (point-min) (point-max))
    (replace-string "@org.junit.Test" "//@org.junit.Test" nil (point-min) (point-max))))

(defun enable-unit-tests ()
  "Uncomment all the unit tests in the current buffer"
  (interactive)
  (save-excursion
    (replace-string "void ttest" "void test" nil (point-min) (point-max))
    (replace-string "//@Test" "@Test" nil (point-min) (point-max))
    (replace-string "//@org.junit.Test" "@org.junit.Test" nil (point-min) (point-max))))

(provide 'mbeenen-java)

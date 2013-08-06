;; These macros aren't very generalized, but are usually just some quick n' dirty shortcuts for frequent operations
(fset 'perl-expand-hash
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 123 2 return 134217742 return 134217744 6] 0 "%d")) arg)))
(fset 'unwind-java-stack-trace
   [?\C-s ?| ?\C-m return ?\C-a])
(fset 'unwind-bsf
   [?\C-\M-s ?: ?\\ ?| ?\{ ?\\ ?| ?\} ?\C-m return])
(fset 'unwind-timing-log
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 44 13 return] 0 "%d")) arg)))

(provide 'mbeenen-keyboard-macros)

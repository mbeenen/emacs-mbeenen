(fset 'perl-expand-hash
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 123 2 return 134217742 return 134217744 6] 0 "%d")) arg)))

(provide 'mbeenen-keyboard-macros)

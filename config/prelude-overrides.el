(defun prelude-coding-hook ()
  "Default coding hook, useful with any programming language."
  (prelude-local-comment-auto-fill)
  (prelude-turn-on-whitespace)
  (prelude-turn-on-abbrev)
  (prelude-add-watchwords))

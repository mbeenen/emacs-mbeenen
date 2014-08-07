(defun prelude-local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun prelude-add-watchwords ()
  (font-lock-add-keywords
   nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
          1 font-lock-warning-face t))))

;; We have a number of turn-on-* functions since it's advised that lambda
;; functions not go in hooks. Repeatedly evaluating an add-to-list with a
;; hook value will repeatedly add it since there's no way to ensure
;; that a lambda doesn't already exist in the list.

(defun prelude-turn-on-whitespace ()
  (whitespace-mode +1))

(defun prelude-turn-off-whitespace ()
  (whitespace-mode -1))

(defun prelude-turn-on-abbrev ()
  (abbrev-mode +1))

(defun prelude-turn-off-abbrev ()
  (abbrev-mode -1))

;; show the name of the current function definition in the modeline
(require 'which-func)
(which-func-mode 1)

(defun mbeenen-prog-mode-hook ()
  "Default coding hook, useful with any programming language."
  (prelude-local-comment-auto-fill)
  (prelude-turn-on-whitespace)
  (prelude-add-watchwords)
  (auto-complete-mode t)
  ;; keep the whitespace decent all the time
  (add-hook 'before-save-hook 'whitespace-cleanup nil t))

;; in Emacs 24 programming major modes generally derive
;; from a common mode named prog-mode
;; (add-hook 'prog-mode-hook 'mbeenen-prog-mode-hook)

;; Compilation related settings
(setq compilation-ask-about-save nil)

;; Colorize the compilation buffer
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'mbeenen-programming)

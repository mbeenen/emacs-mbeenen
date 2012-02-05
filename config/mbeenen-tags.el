;; Etags
(require 'etags)
(require 'ctags)

(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)

;; Override for etags-table-recompute of etags-table. This allows it to
;; find the tags file properly from shell buffers, instead of using buffer-file-name
(defun etags-table-recompute ()
  (when (and (or etags-table-alist etags-table-search-up-depth) default-directory)
    (setq tags-table-list (etags-table-build-table-list default-directory))))

;; Override for etags-table-completion-tabel. Increases the vector size to allow more than
;; 512 tag entries. Not sure why etags has that artificial limit...
(defun etags-tags-completion-table () ; Doc string?
  (let ((table (make-vector 65536 0))
        (progress-reporter
         (make-progress-reporter
          (format "Making tags completion table for %s..." buffer-file-name)
          (point-min) (point-max))))
    (save-excursion
      (goto-char (point-min))
      ;; This monster regexp matches an etags tag line.
      ;;   \1 is the string to match;
      ;;   \2 is not interesting;
      ;;   \3 is the guessed tag name; XXX guess should be better eg DEFUN
      ;;   \4 is not interesting;
      ;;   \5 is the explicitly-specified tag name.
      ;;   \6 is the line to start searching at;
      ;;   \7 is the char to start searching at.
      (while (re-search-forward
              "^\\(\\([^\177]+[^-a-zA-Z0-9_+*$:\177]+\\)?\
\\([-a-zA-Z0-9_+*$?:]+\\)[^-a-zA-Z0-9_+*$?:\177]*\\)\177\
\\(\\([^\n\001]+\\)\001\\)?\\([0-9]+\\)?,\\([0-9]+\\)?\n"
              nil t)
        (intern	(prog1 (if (match-beginning 5)
                           ;; There is an explicit tag name.
                           (buffer-substring (match-beginning 5) (match-end 5))
                         ;; No explicit tag name.  Best guess.
                         (buffer-substring (match-beginning 3) (match-end 3)))
                  (progress-reporter-update progress-reporter (point)))
                table)))
    table))

(provide 'mbeenen-tags)

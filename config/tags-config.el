(add-to-list 'load-path "~/.emacs.d/etags-select")
(add-to-list 'load-path "~/.emacs.d/etags-table")

;; Etags
(require 'etags)

(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)

;; Override for etags-table-recompute of etags-table. This allows it to
;; find the tags file properly from shell buffers, instead of using buffer-file-name
(defun etags-table-recompute ()
  (when (and (or etags-table-alist etags-table-search-up-depth) default-directory)
    (setq tags-table-list (etags-table-build-table-list default-directory))))


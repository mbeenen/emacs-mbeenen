(add-to-list 'load-path "~/.emacs.d/etags-select")
(add-to-list 'load-path "~/.emacs.d/etags-table")

;; Etags
(require 'etags)

(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)

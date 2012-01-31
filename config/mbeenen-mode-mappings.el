;; Javascript
(add-to-list 'auto-mode-alist (cons '(".js$" . javascript-mode)))
(add-to-list 'auto-mode-alist (cons '("javascript.mi" . javascript-mode)))

;; org mode
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\)$" . org-mode))

(provide 'mbeenen-mode-mappings)

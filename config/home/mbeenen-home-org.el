;; Define any home specific variables required for the common initialization
(defvar org-dir "~/emacs/org-mbeenen")

;; Org settings
(setq org-agenda-files (list (concat org-dir "/home.org")
                               (concat org-dir "/refile.org")
                               (concat org-dir "/emacs.org")))
(setq org-default-notes-file (concat org-dir "/refile.org"))
(setq org-default-tasks-file (concat org-dir "/home.org"))

(provide 'mbeenen-home-org)

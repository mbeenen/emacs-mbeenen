(setq org-default-notes-file "~/git/org/organizer.org")

;; I use C-M-r to start capture mode
(global-set-key (kbd "C-M-r") 'org-capture)

;; Capture templates for: TODO tasks, Notes
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/git/org/organizer.org")
               "* TODO %?\n%U\n%a\n  %i" )
              ("n" "note" entry (file "~/git/org/organizer.org")
               "* %? :NOTE:\n%U\n%a\n  %i" ))))


;; Org settings
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-todo-keywords '("TODO(t)" "STARTED(s)" "VERIFY(v)" "|" "DONE(d)" "DELEGATED(g)" "CANCELLED(c)"))                    ;; (6)
(setq org-agenda-include-diary t)                                                ;; (7)
(setq org-agenda-include-all-todo t)                                             ;; (8)

(setq org-agenda-files (list "~/git/org/organizer.org"))


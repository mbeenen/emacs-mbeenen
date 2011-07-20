(require 'org-install)

;; Org settings
(setq org-agenda-files (list "~/git/org/organizer.org"))
(setq org-default-notes-file "~/git/org/organizer.org")
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-done t)
(setq org-agenda-include-all-todo t)     

;; Capture templates for: TODO tasks, Notes
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/git/org/organizer.org")
               "* TODO %?\n%a\n  %i" )
              ("n" "note" entry (file "~/git/org/organizer.org")
               "* %? :NOTE:\n%U\n%a\n  %i" ))))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)"))))
(setq org-use-fast-todo-selection t)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("SOMEDAY" ("WAITING" . t))
              (done ("WAITING"))
              ("TODO" ("WAITING") ("CANCELLED"))
              ("NEXT" ("WAITING"))
              ("STARTED" ("WAITING"))
              ("DONE" ("WAITING") ("CANCELLED")))))

;; ido related config
; Targets include this file and any file contributing to the agenda - up to 2 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2))))

; Stop using paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path nil)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-ido t)

;; Custom Key Bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(define-key org-mode-map "\C-ct" 'bh/org-todo)
(define-key org-mode-map "\C-u\C-ct" 'bh/widen)
(global-set-key (kbd "C-M-r") 'org-capture)

(defun bh/org-todo ()
  (interactive)
  (org-narrow-to-subtree)
  (org-show-todo-tree nil))

(defun bh/widen ()
  (interactive)
  (widen)
  (org-reveal))

;; Synchronization related stuffs
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

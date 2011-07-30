(require 'org-install)

;; Don't know why emacs complains that org-mode-map is undefined otherwise
(define-prefix-command 'org-mode-map)

;; General settings for any org file
(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet
            (make-variable-buffer-local 'yas/trigger-key)
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-group)
            ;; flyspell mode for spell checking everywhere
            ;; (flyspell-mode 1)
            ;; Undefine C-c [ and C-c ] since this breaks my org-agenda files when directories are include
            ;; It expands the files in the directories individually
            (org-defkey org-mode-map "\C-c["    'undefined)
            (org-defkey org-mode-map "\C-c]"    'undefined)))

;; Org settings
(setq org-agenda-files (list "~/emacs/org/organizer.org"))
(setq org-default-notes-file "~/emacs/org/refile.org")
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
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

;; Agenda Customizations
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Notes and Tasks to Refile")
                       (org-agenda-overriding-header "Tasks to Refile")))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
                (tags-todo "-WAITING-CANCELLED/!NEXT|STARTED"
                           ((org-agenda-overriding-header "Next Tasks")
                            (org-agenda-skip-function 'bh/skip-projects)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED/!-NEXT-STARTED-WAITING"
                           ((org-agenda-overriding-header "Relevant Tasks")
                            (org-agenda-skip-function 'bh/skip-non-relevant-tasks)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-todo-ignore-scheduled t)
                            (org-agenda-todo-ignore-deadlines t)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-todo-ignore-scheduled 'future)
                            (org-agenda-todo-ignore-deadlines 'future)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (todo "WAITING|SOMEDAY"
                      ((org-agenda-overriding-header "Waiting and Postponed tasks")
                       (org-agenda-skip-function 'bh/skip-projects)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks))))
               nil)
              ("r" "Tasks to Refile" tags "REFILE"
               ((org-agenda-overriding-header "Notes and Tasks to Refile")
                (org-agenda-overriding-header "Tasks to Refile")))
              ("#" "Stuck Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Stuck Projects")
                (org-tags-match-list-sublevels 'indented)
                (org-agenda-skip-function 'bh/skip-non-stuck-projects)))
              ("n" "Next Tasks" tags-todo "-WAITING-CANCELLED/!NEXT|STARTED"
               ((org-agenda-overriding-header "Next Tasks")
                (org-agenda-skip-function 'bh/skip-projects)
                (org-tags-match-list-sublevels t)
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              ("R" "Relevant Tasks" tags-todo "-REFILE-CANCELLED/!-NEXT-STARTED-WAITING"
               ((org-agenda-overriding-header "Relevant Tasks")
                (org-agenda-skip-function 'bh/skip-non-relevant-tasks)
                (org-tags-match-list-sublevels 'indented)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("p" "Projects" tags-todo "-CANCELLED/!"
               ((org-agenda-overriding-header "Projects")
                (org-agenda-skip-function 'bh/skip-non-projects)
                (org-tags-match-list-sublevels 'indented)
                (org-agenda-todo-ignore-scheduled 'future)
                (org-agenda-todo-ignore-deadlines 'future)
                (org-agenda-sorting-strategy
                 '(category-keep))))
              ("w" "Waiting Tasks" todo "WAITING|SOMEDAY"
               ((org-agenda-overriding-header "Waiting and Postponed tasks"))
               (org-agenda-skip-function 'bh/skip-projects))
              ("A" "Tasks to Archive" tags "-REFILE/"
               ((org-agenda-overriding-header "Tasks to Archive")
                (org-agenda-skip-function 'bh/skip-non-archivable-tasks))))))

(setq org-tags-match-list-sublevels nil)

(defun bh/is-subproject-p ()
  "Any task which is a subtask of another project"
  (let ((is-subproject)
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (while (and (not is-subproject) (org-up-heading-safe))
        (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
          (setq is-subproject t))))
    (and is-a-task is-subproject)))

(defun bh/is-project-p ()
  "Any task with a todo keyword subtask and is not a subtask of another project
This does not support projects with subprojects"
  (let ((has-subtask)
        (subtree-end (save-excursion (org-end-of-subtree t)))
        (is-subproject (bh/is-subproject-p))
        (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
    (save-excursion
      (forward-line 1)
      (while (and (not has-subtask)
                  (< (point) subtree-end)
                  (re-search-forward "^\*+ " subtree-end t))
        (when (member (org-get-todo-state) org-todo-keywords-1)
          (setq has-subtask t))))
    (and is-a-task has-subtask (not is-subproject))))

(defun bh/skip-non-stuck-projects ()
  "Skip trees that are not stuck projects"
  (let* ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
         (subtree-end (save-excursion (org-end-of-subtree t)))
         (has-next (save-excursion
                     (forward-line 1)
                     (and (< (point) subtree-end)
                          (re-search-forward "^\\*+ \\(NEXT\\|STARTED\\) " subtree-end t)))))
    (if (and (bh/is-project-p) (not has-next))
        nil ; a stuck project, has subtasks but no next task
      next-headline)))

(defun bh/skip-non-project-trees ()
  "Skip trees that are not projects"
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (bh/is-project-p)
        nil
      subtree-end)))

(defun bh/skip-non-subprojects ()
  "Skip trees that are not projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (if (bh/is-subproject-p)
        nil
      next-headline)))

(defun bh/skip-project-trees-and-habits ()
  "Skip trees that are projects"
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (cond
     ((bh/is-project-p)
      subtree-end)
     ((org-is-habit-p)
      subtree-end)
     (t
      nil))))

(defun bh/skip-projects ()
  "Skip trees that are projects"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (cond
     ((bh/is-project-p)
      next-headline)
     (t
      nil))))

(defun bh/skip-projects-and-habits ()
  "Skip trees that are projects and tasks that are habits"
  (let ((next-headline (save-excursion (outline-next-heading))))
    (cond
     ((bh/is-project-p)
      next-headline)
     ((org-is-habit-p)
      next-headline)
     (t
      nil))))

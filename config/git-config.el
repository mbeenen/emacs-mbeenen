
;; Magit customizations, overriding a few functions

;; Always add --rebase option to pull
(defun magit-pull ()
  (interactive)
  (let* ((branch (magit-get-current-branch))
	 (config-branch (and branch (magit-get "branch" branch "merge")))
	 (merge-branch (or config-branch
			   (magit-read-rev (format "Pull from")))))
    (if (and branch (not config-branch))
	(magit-set merge-branch "branch" branch "merge"))
    (magit-run-git-async "pull" "-v" "--rebase")))

;; Always use --squash option with a merge
(defun magit-automatic-merge (revision)
  "Merge REVISION into the current 'HEAD'; commit unless merge fails.
\('git merge REVISION')."
  (interactive (list (magit-read-rev "Merge" (magit-guess-branch))))
  (if revision
      (magit-run-git "merge" "--squash" (magit-rev-to-git revision))))

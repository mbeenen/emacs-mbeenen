;; projectile is a project management mode
(require 'projectile)
(projectile-global-mode t)

(defvar projectile-project-compile-command ""
  "Project specific compile command, to be run from the project root.
Should be defined as a directory local variable within the project")
(make-variable-buffer-local 'projectile-project-compile-command)

(defvar projectile-project-test-command ""
  "Project specific test command, to be run from the project root.
Should be defined as a directory/buffer local variable within the project")
(make-variable-buffer-local 'projectile-project-test-command)

(defvar projectile-project-run-command ""
  "Project specific run command, to be run from the project root.
Should be defined as a directory/buffer local variable within the project")
(make-variable-buffer-local 'projectile-project-run-command)

(defun get-projectile-command (command)
  "Returns a string to be executed as the command executed from the project root"
  (let ((final-command (substitute-project-variables command)))
    (concat "cd " (projectile-get-project-root) "; " final-command)))

(defun projectile-compile-project ()
  "Executes the test command for the project from the project root"
  (interactive)
  (compile (get-projectile-command projectile-project-compile-command)))

(defun projectile-test-project ()
  "Executes the test command for the project from the project root"
  (interactive)
  (compile (get-projectile-command projectile-project-test-command)))

(defun projectile-run-project ()
  "Executes the test command for the project from the project root"
  (interactive)
  (shell-command (get-projectile-command projectile-project-run-command)))

(defun substitute-project-variables (command)
  "Replaces all the substitution patterns found in the command"
  (let ((command-with-substitutions command))
    ;; list of substitution variables
    (setq command-with-substitutions
          (replace-regexp-in-string "${fqcn}" (get-fully-qualified-classname) command-with-substitutions))
    (setq command-with-substitutions
          (replace-regexp-in-string "${buffer-name}" (buffer-file-name) command-with-substitutions))
    ))

;; (add-hook
;;  'prog-mode-hook
;;  (lambda ()
;;    ;; This doesn't quite seem to work yet, possibly the hook gets run before any
;;    ;; directory local variables are set
;;    (set (make-local-variable 'compile-command)
;;         (get-projectile-command projectile-project-compile-command))))

(provide 'mbeenen-projectile)

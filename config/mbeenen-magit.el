(require 'magit)
;; Magit customizations
(set-face-attribute 'magit-diff-add nil
                    :foreground "#8CD0D3")
(set-face-attribute 'magit-diff-del nil
                    :foreground "#CC9393")
(set-face-attribute 'magit-item-highlight nil
                    :background "#4F4F4F")
(set-face-attribute 'magit-log-graph nil
                    :foreground "light green")

(defvar magit-status-fullscreen-window-configuration-register
  ?b
  "The register to store the current window configuration in when
entering fullscreen magit-status.")

(defvar magit-status-fullscreen-register
  ?g
  "The register to store the fullscreen magit-status
window configuration in.")

(defun magit-kill-file-on-line ()
  "Show file on current magit line and prompt for deletion."
  (interactive)
  (magit-visit-item)
  (delete-current-buffer-file)
  (magit-refresh))

(defun magit-status-fullscreen ()
  "Save the current window configuration, run magit-status
and delete other windows, providing a fullscreen git mode.
The previous window configuration is stored in the register
specified by the magit-status-fullscreen-window-configuration-register
variable. The fullscreen magit status configuration is stored
in register specified by the magit-status-register variable."
  (interactive)
  (window-configuration-to-register magit-status-fullscreen-window-configuration-register)
  (magit-status (magit-get-top-dir default-directory))
  (delete-other-windows)
  (window-configuration-to-register magit-status-fullscreen-register))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the
magit buffer"
  (interactive)
  (let ((magit-buffer (current-buffer)))
    (jump-to-register magit-status-fullscreen-window-configuration-register)
    (kill-buffer magit-buffer)))

(defun magit-toggle-whitespace ()
  (interactive)
  (if (member "-w" magit-diff-options)
      (magit-dont-ignore-whitespace)
    (magit-ignore-whitespace)))

(defun magit-ignore-whitespace ()
  (interactive)
  (add-to-list 'magit-diff-options "-w")
  (magit-refresh))

(defun magit-dont-ignore-whitespace ()
  (interactive)
  (setq magit-diff-options (remove "-w" magit-diff-options))
  (magit-refresh))

(define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

(setq magit-last-seen-setup-instructions "1.4.0")

(provide 'mbeenen-magit)

(push "~/.emacs.d/elpa/yasnippet" load-path)
(push "~/projects/emacs-mbeenen/config" load-path)
(push "~/projects/emacs-mbeenen/config/home" load-path)
(push "~/projects/emacs-mbeenen/config/libs" load-path)

(load-file "~/projects/emacs-mbeenen/config/home/env-variables.el")

(load-file "~/projects/emacs-mbeenen/config/home/cedet-config.el")
(load-file "~/projects/emacs-mbeenen/config/color-config.el")
(load-file "~/projects/emacs-mbeenen/config/dired-config.el")
(load-file "~/projects/emacs-mbeenen/config/eclim-config.el")
(load-file "~/projects/emacs-mbeenen/config/efuncs.el")
(load-file "~/projects/emacs-mbeenen/config/elisp-config.el")
(load-file "~/projects/emacs-mbeenen/config/erc-config.el")
(load-file "~/projects/emacs-mbeenen/config/general-config.el")
(load-file "~/projects/emacs-mbeenen/config/general-keybindings.el")
(load-file "~/projects/emacs-mbeenen/config/ido-config.el")
(load-file "~/projects/emacs-mbeenen/config/javascript-config.el")
(load-file "~/projects/emacs-mbeenen/config/jdee-config.el")
(load-file "~/projects/emacs-mbeenen/config/org-config.el")
(load-file "~/projects/emacs-mbeenen/config/shell-config.el")
(load-file "~/projects/emacs-mbeenen/config/tags-config.el")

(load-file "~/projects/emacs-mbeenen/config/home/color-config.el")
(load-file "~/projects/emacs-mbeenen/config/home/init-shell.el")

;; Load the desktop last
(load-file "~/projects/emacs-mbeenen/config/desktop-config.el")



;; These configurations taken from emacs-fu blog:
;; http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html

; joining && auto joining
(require 'erc)
(require 'tls)
(require 'rcirc)
(require 'rcirc-notify)
;; make sure to use wildcards for e.g. freenode as the actual server
;; name can be be a bit different, which would screw up autoconnect
(erc-autojoin-mode t)
(setq erc-autojoin-channels-alist nil)

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"

                                 "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

(setq rcirc-server-alist
      '(("ircs.amazon.com" :port 6697 :encryption tls
	 :channels ("#p13n"))))
(rcirc-track-minor-mode)

(defun mbeenen-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "ircs.amazon.com:6697") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc-tls :server "ircs.amazon.com" :port 6697
           :nick "mbeenen" :full-name "Michael Beenen"))))

(provide 'mbeenen-erc)

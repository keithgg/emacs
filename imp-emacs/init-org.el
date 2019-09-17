(use-package org
  :ensure t
  :config
  '(org-agenda-ndays 30)
  '(org-agenda-start-on-weekday nil)
  '(org-archive-mark-done t)
  '(org-clock-persist t)
  '(org-descriptive-links t)
  '(org-publish-use-timestamps-flag t)
  '(shell-file-name "/bin/bash")
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-cc" 'org-capture)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (global-set-key [C-f5] 'org-decrypt-entry)
  (setq org-clock-into-drawer nil)
  (setq org-time-clocksum-format
        '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
  (setq org-duration-format (quote h:mm))
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
  )


(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance (quote ("crypt")))
;; Remember to set the encrypt key (setq org-crypt-key "blahblah")

(provide 'init-org)
;;; init-org.el ends here

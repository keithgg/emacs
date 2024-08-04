(require 'use-package)

(setq dired-recursive-copies (quote always))
(setq dired-listing-switches "-alh")

(use-package direnv
  :ensure t
  )

(use-package envrc
  :ensure t
  :config
  (envrc-global-mode)
  )

(use-package ssh-agency
  :ensure t
  )

(provide 'init-dired)

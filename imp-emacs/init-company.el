(require 'use-package)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1)
  )

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(provide 'init-company)

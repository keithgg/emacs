(use-package geben
  :ensure t
  :config
  (autoload 'geben "geben" "PHP Debugger on Emacs" t)
  )

(use-package php-mode
  :ensure t
  )

(use-package php-refactor-mode
  :ensure t
  :config
  (add-hook 'php-mode-hook 'php-refactor-mode)
  )

(use-package company-php
  :ensure t
  :config
  (add-hook 'php-mode-hook
          '(lambda ()
             (ac-php-core-eldoc-setup) 
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)))
  )
(provide 'init-php)

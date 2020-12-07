(require 'use-package)
(use-package company
  :ensure t
  )

(use-package company-jedi
  :ensure t
  :config
  (defun my/python-mode-hook ()
    (add-to-list 'company-backends 'company-jedi)
    (jedi-mode)
    )

  (add-hook 'python-mode-hook 'my/python-mode-hook)
  )

(use-package python
  :config
  :bind (:map python-mode-map
              ("C-c ." . jedi:goto-definition)
              ("C-c ," . jedi:goto-definition-pop-marker)
              )
  
  )

(use-package traad
  :ensure t
  )

(provide 'init-python-jedi)

(use-package py-isort
  :ensure t
  )

(use-package blacken
  :ensure t
  :config
  (add-hook 'python-mode-hook 'blacken-mode)
  )

(provide 'init-python)

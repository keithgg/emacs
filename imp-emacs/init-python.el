(use-package py-isort
  :ensure t
  )

(use-package blacken
  :ensure t
  :config
  ;; (add-hook 'python-mode-hook 'blacken-mode)
  )

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
(use-package pyenv-mode
  :ensure t
  )

(provide 'init-python)

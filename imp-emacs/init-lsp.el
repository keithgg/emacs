(use-package lsp-mode
  :ensure t
  )

(use-package lsp-ui
  :ensure t
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (setq lsp-ui-doc-enable nil
      lsp-ui-peek-enable nil
      lsp-ui-sideline-enable nil
      lsp-ui-imenu-enable nil
      lsp-ui-flycheck-enable t)
  )

(use-package lsp-python
  :ensure t
  :config
  (add-hook 'python-mode-hook #'lsp-python-enable)
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends)
  )


(use-package lsp-javascript-typescript
  :ensure t
  :config
  (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
  (defun my-company-transformer (candidates)
    (let ((completion-ignore-case t))
      (all-completions (company-grab-symbol) candidates)))

  (defun my-js-hook nil
    (make-local-variable 'company-transformers)
    (push 'my-company-transformer company-transformers))

  (add-hook 'js-mode-hook 'my-js-hook)
  )

(provide 'init-lsp)

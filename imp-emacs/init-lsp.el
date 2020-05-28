(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook #'lsp) ; or lsp-deferred
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024 10)) ;; 1mb
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500)
  (add-to-list 'flycheck-checkers 'lsp)
  (with-eval-after-load 'lsp-mode
    (setq lsp-diagnostics-modeline-scope :project)
    (add-hook 'lsp-managed-mode-hook 'lsp-diagnostics-modeline-mode))
  (setq lsp-enable-indentation t)
  (setq lsp-enable-on-type-formatting t)
  (setq lsp-before-save-edits t)
  (setq lsp-enable-file-watchers t)
  (setq lsp-enable-text-document-color t)
  (setq lsp-enable-completion-at-point t)
  
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
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
  )


(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)


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

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook #'lsp) ; or lsp-deferred
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024 10)) ;; 1mb
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500)
  )

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-auto-configure nil)
  )

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends)
  (setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
  )

(use-package lsp-python-ms
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)


(provide 'init-lsp)

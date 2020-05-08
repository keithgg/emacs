(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq flycheck-checker-error-threshold 10000)
  )

(use-package flycheck-color-mode-line
  :ensure t
  :config
  (eval-after-load "flycheck"
    '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
  
  )

(provide 'init-flycheck)


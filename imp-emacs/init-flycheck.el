(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :bind (:map flycheck-mode-map
              ("M-n" . flycheck-next-error) ; optional but recommended error navigation
              ("M-p" . flycheck-previous-error))
  :config
  (setq flycheck-checker-error-threshold 10000)
  (setq warning-suppress-types '((flycheck)))
  )


(use-package flycheck-color-mode-line
  :ensure t
  :config
  (eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
  )

(provide 'init-flycheck)


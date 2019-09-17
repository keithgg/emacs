(use-package ag
  :ensure t
  :config
  (setq ag-highlight-search t)
  (add-hook 'ag-mode-hook 'toggle-truncate-lines)
  )

(use-package wgrep
  :ensure t
  )

(use-package wgrep-ag
  :ensure t
  )

(provide 'init-ag)

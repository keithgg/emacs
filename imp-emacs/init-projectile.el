(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  )

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(provide 'init-projectile)

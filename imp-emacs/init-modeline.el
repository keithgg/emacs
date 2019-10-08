(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-vibrant t)
  )

(provide 'init-modeline)

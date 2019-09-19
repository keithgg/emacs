(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

(use-package doom-themes
  :ensure t
  )

(load-theme 'doom-vibrant)

(provide 'init-modeline)

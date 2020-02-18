(use-package py-isort
  :ensure t
  )

(use-package blacken
  :ensure t
  :config
  (add-hook 'python-mode-hook 'blacken-mode)
  )

;; (use-package python-black
;;   :ensure t
;;   :demand t
;;   :after python
;;   :config
;;   (setq python-black-on-save-mode 1))

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'column)
  (setq highlight-indent-guides-auto-enabled t)
  )

(provide 'init-python)

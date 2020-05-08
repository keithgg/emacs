
(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
  )


(use-package ansible-vault
  :ensure t
  :config
  (defun ansible-vault-mode-maybe ()
    (when (ansible-vault--is-vault-file)
      (ansible-vault-mode 1))
    )
  (add-hook 'yaml-mode-hook 'ansible-vault-mode-maybe)
  )

(provide 'init-yaml)

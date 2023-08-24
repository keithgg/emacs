(require 'use-package)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (define-key projectile-rails-mode-map (kbd "C-c .") 'projectile-rails-goto-file-at-point)
  )

;; (use-package inf-ruby
;;   :ensure t
;;   )

;; (use-package company-inf-ruby
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-inf-ruby)
;;   )

;; (use-package enh-ruby-mode
;;   :ensure t
;;   :config
;;   (add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
;;   (setq enh-ruby-bounce-deep-indent t)
;;   (setq enh-ruby-bounce-deep-indent-paren t)
;;   (setq enh-ruby-hanging-brace-indent-level 2)
;;   (setq enh-ruby-hanging-paren-deep-indent-level 2)
;;   (setq enh-ruby-hanging-indent-level 2)
;;   (setq enh-ruby-indent-level 2)
;;   (add-to-list 'auto-mode-alist
;;              '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
;;   )

;; (use-package rubocop
;;   :ensure t
;;   :config
;;   (add-hook 'ruby-mode-hook #'rubocop-mode)
;;   )


(use-package web-mode
  :ensure t
  :config
  (progn
    (defun my-web-mode-erb-hook()
      (if (equal web-mode-engine "erb")
          (setq web-mode-markup-indent-offset 4)
        )
      )
    (add-hook 'web-mode-hook 'my-web-mode-erb-hook)
    )
  )


(provide 'init-ruby)

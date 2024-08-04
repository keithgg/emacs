(require 'use-package)

(use-package projectile-rails
  :ensure t
  :config
  (projectile-rails-global-mode)
  (define-key projectile-rails-mode-map (kbd "C-c .") 'projectile-rails-goto-file-at-point)
  )

(use-package rvm
  :ensure t
  :config
  (rvm-use "ruby-3.3.0" "default")
  )

(use-package apheleia
  :ensure t
  :hook (
         (ruby-mode . apheleia-mode)
         (enh-ruby-mode . apheleia-mode)
         )
  :config
  (add-to-list 'apheleia-mode-alist '(ruby-mode . ruby-standard))
  (add-to-list 'apheleia-mode-alist '(enh-ruby-mode . ruby-standard))
  )

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist
               '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))
  (setq enh-ruby-bounce-deep-indent t)
  (setq enh-ruby-bounce-deep-indent-paren t)
  (setq enh-ruby-hanging-brace-indent-level 2)
  (setq enh-ruby-hanging-paren-deep-indent-level 2)
  (setq enh-ruby-hanging-indent-level 2)
  (setq enh-ruby-indent-level 2)
)

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

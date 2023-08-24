(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (python-mode . lsp)
         (js-mode . lsp)
         (rjsx-mode . lsp)
         (typescript-mode . lsp)
         (enh-ruby-mode . lsp)
         (terraform-mode . lsp)
         (ruby-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))

  :commands lsp
  :config

  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024 10)) ;; 1mb
  (setq lsp-prefer-capf t)
  (setq lsp-idle-delay 0.500)
  (setq lsp-file-watch-threshold 10000)
  )

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(use-package dap-mode :ensure t)

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(provide 'init-lsp)

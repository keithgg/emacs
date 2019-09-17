(require 'use-package)

(use-package writegood-mode
  :ensure t
  )
  

(use-package markdown-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))
  (add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (writegood-mode t)
            (flyspell-mode t)))
  (setq markdown-command "pandoc --smart -f markdown -t html")
  )

(provide 'init-markdown)

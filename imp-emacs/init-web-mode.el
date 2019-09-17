(use-package web-mode
  :ensure t
  :defer 5
  :mode "\\.html?\\'" "\\.phtml\\'" "\\.tpl\\.php\\'" "\\.jsp\\'"
  "\\.as[cp]x\\'" "\\.erb\\'" "\\.mustache\\'" "\\.djhtml\\'" "\\.blade.php\\'"
  :config
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-engines-alist
        '(("django"."\\.html\\'"))
        )
  )

(provide 'init-web-mode)


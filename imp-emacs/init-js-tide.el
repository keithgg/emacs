(require 'use-package)

(use-package json-mode
  :ensure t
  )


(use-package prettier-js
  :ensure t
  )

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck web-mode)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         )
  :config
  (define-key tide-mode-map (kbd "C-c .") 'tide-jump-to-definition)
  (define-key tide-mode-map (kbd "C-c ,") 'tide-jump-back)
  (define-key tide-mode-map (kbd "C-c r") 'tide-rename-symbol)
  (setq company-tooltip-align-annotations t)
  )

(use-package web-mode
  :ensure t
  :config
  (progn
    (defun my-web-mode-js-hook()
      
      (if (string-equal web-mode-content-type "jsx")
          (progn
            (setup-tide-mode)
            (flycheck-mode 1)
            (prettier-js-mode)
            )
        )
    
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (setup-tide-mode)
        (flycheck-mode 1)
        (prettier-js-mode)
        )
      )
    (setq-default indent-tabs-mode nil)
    (setq js-indent-level 2)
    (setq web-mode-code-indent-offset 2)
    )
  

  (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))
  
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))

  (flycheck-add-mode 'javascript-eslint 'web-mode)

  )

(provide 'init-js-tide)
;; init-js.el ends here

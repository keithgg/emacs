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
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (prettier-js-mode 1)
  (company-mode +1)
  (tide-hl-identifier-mode)
  )

(use-package tide
  :ensure t
  :hook (
         (typescript-mode . setup-tide-mode)
         (rjsx-mode . setup-tide-mode)
         )
  :config
  (print "at least called this")
  (define-key tide-mode-map (kbd "C-c .") 'tide-jump-to-definition)
  (define-key tide-mode-map (kbd "C-c ,") 'tide-jump-back)
  (define-key tide-mode-map (kbd "C-c r") 'tide-rename-symbol)
  (setq-default indent-tabs-mode nil)
  (setq js-indent-level 2)
  (setq web-mode-code-indent-offset 2)
  (setq company-tooltip-align-annotations t)
  )

(provide 'init-js-tide)
;; init-js.el ends here

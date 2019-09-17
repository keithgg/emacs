(require 'use-package)

(use-package company-tern
  :ensure t
  )

;; (use-package import-js
;;   :ensure t
;;   :config
;;   (run-import-js)
;;   (add-hook 'kill-emacs-hook (lambda () (kill-import-js)))
;;   )

(use-package json-mode
  :ensure t
  )

(use-package tern
  :ensure t
  :bind (:map tern-mode-keymap
              ("C-c ." . tern-find-definition)
              ("C-c ," . tern-pop-find-definition)
              )
  :config
  (defvar tern-command (list "export NODE_ENV=development && tern"))
  (add-hook 'js-mode-hook (lambda () (tern-mode t)))
  (add-to-list 'company-backends 'company-tern)
  )

(use-package web-mode
  :ensure t
  :config
  (progn
    (defun my-web-mode-js-hook()
      (if (equal web-mode-content-type "jsx")
          (tern-mode)
        ;; (add-hook 'after-save-hook 'import-js-fix nil 'make-it-local)
        )
    
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (setup-tide-mode))
      )
    )
  (setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?\\'")))
  (add-hook 'web-mode-hook 'my-web-mode-js-hook)
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  )


(provide 'init-js)
;; init-js.el ends here

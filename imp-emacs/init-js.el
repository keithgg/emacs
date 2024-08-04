(require 'use-package)

;; (use-package import-js
;;   :ensure t
;;   :config
;;   (run-import-js)
;;   (add-hook 'kill-emacs-hook (lambda () (kill-import-js)))
;;   )

(use-package json-mode
  :ensure t
  )


(add-to-list 'auto-mode-alist '("\\.js\\'" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))


(use-package nvm
  :ensure t
  )

(use-package prettier-js
  :ensure t
  :hook (

         (typescript-mode . prettier-js-mode)
         (typescript-ts-mode . prettier-js-mode)

         (tsx-ts-mode . prettier-js-mode)
         (tsx-mode . prettier-js-mode)

         (js-mode . prettier-js-mode)
         (js-ts-mode . prettier-js-mode)

         (jsx-ts-mode . prettier-js-mode)
         (jsx-mode . prettier-js-mode)
         )
  )

(provide 'init-js)

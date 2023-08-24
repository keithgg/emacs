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

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
  )

(use-package nvm
  :ensure t
  )

(use-package prettier-js
  :ensure t
  :hook (rjsx-mode . prettier-js-mode)
  )

(provide 'init-js)
;; init-js.el ends here

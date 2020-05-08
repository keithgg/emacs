(require 'use-package)

(use-package eglot
  :ensure t
  :config
  (add-hook 'python-mode-hook 'eglot-ensure)
  )


(provide 'init-eglot)

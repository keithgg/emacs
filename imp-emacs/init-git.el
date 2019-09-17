(require 'use-package)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (setq magit-save-repository-buffers nil)
  )

(use-package git-timemachine
  :ensure t
  )

(use-package git-gutter+
  :ensure t
  :init (global-git-gutter+-mode)
  :diminish (git-gutter+-mode . "gg"))

(provide 'init-git)

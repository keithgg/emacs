(use-package counsel
  :ensure t
  )

(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)

  (defun full-quit ()
    (interactive)
    (minibuffer-keyboard-quit)
    (keyboard-quit)
    )
  (global-set-key (kbd "C-g") 'full-quit)
  )

(use-package smex
  :ensure t
  :config
  (setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  )

(provide 'init-ivy)


(find-file-noselect "/home/keith/id/carebit/clients/carebit-shared/hooks/useWebSocket.js")

(setq find-file-visit-truename nil)

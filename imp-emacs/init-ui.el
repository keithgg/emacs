;; hide scrollbars and menus
;; directory for self installed files

(setq create-lockfiles nil)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq-default indent-tabs-mode nil)
(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key [f6] 'revert-buffer )

(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(delete-selection-mode t)
(transient-mark-mode t)
(setq select-enable-clipboard t)
(setq column-number-mode t)

(setq-default show-trailing-whitespace nil)

(setq auto-save-dir (concat user-emacs-directory "auto-saves"))

(make-directory auto-save-dir t)
(setq backup-by-copying t)
(setq backup-directory-alist `((".*" . "~/.emacs.d/auto-saves")))
(setq auto-save-file-name-transforms `((".*" , "~/.emacs.d/auto-saves" t)))


(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (remove-hook 'beacon-dont-blink-predicates #'beacon--compilation-mode-p)
  )

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  )

(use-package so-long
  :ensure t
  :config
  (global-so-long-mode 1))

(use-package ws-butler
  :ensure t
  :config
  (ws-butler-global-mode 1)
  )

(setq mouse-yank-at-point t)
(add-hook 'write-file-hooks 'delete-trailing-whitespace nil t)
(which-function-mode)
(setq-default pgtk-wait-for-event-timeout 0)

(provide 'init-ui)
;;; init-ui.el ends here

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (
   (lsp-mode . lsp-enable-which-key-integration)
   (lsp-mode . lsp-diagnostics-mode)
   ((python-mode
     python-ts-mode

         js-mode
         js-ts-mode

         typescript-mode
         typescript-ts-mode

         tsx-mode
         tsx-ts-mode

         ruby-mode
         ruby-ts-mode
         enh-ruby-mode

         terraform-mode) . lsp)
   )
         ;; if you want which-key integration


  :commands lsp
  :custom
  (gc-cons-threshold 100000000)
  (lsp-enable-text-document-color nil)
  (lsp-file-watch-threshold 10000)
  (lsp-idle-delay 0.5)
  (lsp-log-io nil)
  (lsp-prefer-capf t)
  (read-process-output-max (* 1024 1024 10))
  (lsp-lens-enable nil)
  (lsp-modeline-diagnostics-enable nil)
  (lsp-headerline-breadcrumb-enable-diagnostics nil)
  (lsp-headerline-breadcrumb-enable-symbol-numbers nil)
  :config
  (lsp-make-interactive-code-action remove-unused-imports "source.removeUnusedImports.ts")
  (lsp-make-interactive-code-action add-missing-imports "source.addMissingImports.ts")
  (lsp-make-interactive-code-action sort-imports "source.sortImports.ts")
  )

(use-package lsp-mode
  ;; ... previous configuration
  :preface
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)

       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))
  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?)                             ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection))  ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  :init
  (setq lsp-use-plists t)
  ;; Initiate https://github.com/blahgeek/emacs-lsp-booster for performance
  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command))

(use-package lsp-completion
  :no-require
  :hook ((lsp-mode . lsp-completion-mode)))

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

(with-eval-after-load 'js-ts
  (define-key js-mode-map (kbd "M-.") nil))

(use-package dap-mode :ensure t)

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)

(provide 'init-lsp)

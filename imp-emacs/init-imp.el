(load "package")
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(if (package-installed-p 'use-package)
    nil
  (package-refresh-contents)
  (package-install 'use-package)
  )


(require 'use-package)

(provide 'init-imp)

(add-to-list 'load-path user-emacs-directory)

(require 'better-defaults)
(require 'init-elpa)
(require 'init-themes)
(require 'init-python)
(require 'init-js)
(require 'init-html)
(require 'init-misc)
(require 'init-defuns)
(require 'init-keybindings)

;; projectile for project-level commands
(require 'projectile)
(projectile-global-mode)

;; enhancements for displaying flymake errors
(require-package 'flymake-cursor)
(require 'flymake-cursor)

;; Markdown mode!
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes (quote ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "red"))))
 '(flymake-warnline ((t (:background "firebrick" :underline "#de935f")))))

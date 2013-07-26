(require-package 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(sanityinc-tomorrow-night))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;; ## font settings
;; ### font size
;; tweak the value at the end of the line. It's in 1/10th points, so
;; 11pt == 110
(set-face-attribute 'default nil :height 140)

;; Inconsolata - brian's goto. http://www.levien.com/type/myfonts/inconsolata.html
(set-default-font "Inconsolata-14") 

;; ## flymake styling
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((t (:background "red"))))
 '(flymake-warnline ((t (:background "tomato")))))


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-tomorrow-day))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-tomorrow-night))

(provide 'init-themes)

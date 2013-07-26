(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; set python block comment prefix
(defvar py-block-comment-prefix "##")

(provide 'init-python)

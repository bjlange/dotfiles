;; # pimp-my-emacs Default .emacs file 

;; This file gets run when you start emacs, so it's where you can
;; include packages, turn stuff off, and customize your editing
;; environment. This file is heavily commented- it's pretty self
;; explanatory. Comments in elisp are indicated by two semicolons.
;;
;; As you play around in the file, you can test out your changes by
;; marking the part you change and hitting C-x C-e to "execute" the
;; elisp code. Just remember to save the file.
;; ================================================================

;; adds the directory with packages, etc. to the load path
(add-to-list 'load-path "~/.emacs.d/")

;; ================================================================
;; # ANNOYANCES
;; disable some of the stupid stuff that loads by
;; default in emacs.  

;; Turns off the big chunky toolbar.
(tool-bar-mode 0)

;; Turns off the scrollbar.
(toggle-scroll-bar -1) 

;; Turns off the menubar, but only when you're in the terminal.
;; Replace with (menu-bar-mode 0) to turn it off everywhere.
(if window-system
    (menu-bar-mode 1)
  (menu-bar-mode 0))

;; Turns off welcome screen
(setq inhibit-startup-message t) 

;; type "y"/"n" instead of "yes"/"no"
(fset 'yes-or-no-p 'y-or-n-p)

;; turn off the friggin bell
(setq-default visible-bell t)


;; ================================================================
;; # INTERFACE 
;; make emacs pretty

;; standard 80-chars wide
(set-frame-width (selected-frame) 80)

;; parenthesis highlighting on
(show-paren-mode 1)

;; show column number at the bottom
(column-number-mode 1)

;; ## color-theme 
;; an addon for emacs 23 that lets you set colors for syntax
;; highlighting
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/color-theme"))
(load "color-theme")


;; I personally like Tomorrow Night
;; https://github.com/chriskempson/tomorrow-theme
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night)
;; (color-theme-tomorrow)
;; (color-theme-tomorrow-night-blue)
;; (color-theme-tomorrow-night-bright)
;; (color-theme-tomorrow-night-eighties)

;; Other options included (just comment out the block above and
;; uncomment the block you want to try below)

;; Solarized
;; https://github.com/sellout/emacs-color-theme-solarized
;; (only uncomment light/dark depending on what you want to use)
;; (require 'color-theme-solarized)
;; (color-theme-solarized-light)
;; (color-theme-solarized-dark)

;; Zenburn - low contrast dark theme
;; https://github.com/dbrock/zenburn-el
;; (require 'color-theme-zenburn)
;; (color-theme-zenburn)


;; ## font settings
;; ### font size
;; tweak the value at the end of the line. It's in 1/10th points, so
;; 11pt == 110
(set-face-attribute 'default nil :height 120)

;; ### font faces uncomment them and restart to try them!  
;; note: you'll probably want a size smaller than 12 for
;; non-Inconsolata fonts

;; DejaVu Sans Mono - comes with Ubuntu
;; (set-default-font "-unknown-DejaVu Sans-bold-normal-normal-*-*-*-*-*-*-0-iso10646-1")

;; Inconsolata - brian's goto. http://www.levien.com/type/myfonts/inconsolata.html
(set-default-font "Inconsolata-12") 

;; Source Code Pro - open source font from Adobe https://github.com/adobe/source-code-pro
;; (set-default-font "-adobe-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; Anonymous Pro - another supposedly good free one http://www.ms-studio.com/FontSales/anonymouspro.html
;; (set-default-font "-unknown-Anonymous Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")



;; ================================================================
;; # ADDONS
;; make emacs do more stuff

;; ido mode- "interactively do things"
;; a different way of navigating the common minibuffer menus.  fuzzy
;; file name match, remote file access. no more mashing the tab key.
;; it's pretty badass
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; mercurial support (it's kinda shaky)
(require 'mercurial)

;; scss mode!
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/scssmode"))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; multi-web-mode 
;; auto-switches between css, js, html, and php when you're in a mixed
;; document.
;; via here: https://github.com/fgallina/multi-web-mode#readme
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=['\"]text/javascript['\"]\\|language=['\"]javascript['\"]\\)[^>]*>" "</script>")
                  (css-mode "<style +type=['\"]text/css['\"][^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5" "jsp"))
(multi-web-global-mode 1)

;; markdown mode 
;; nice highlighting and rendering of markdown docs
(autoload 'markdown-mode "markdown-mode.el" 
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist 
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; setup handlebars mode. for details, see here:
;; https://github.com/danielevans/handlebars-mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/handlebars-mode"))
(require 'handlebars-mode)

;; recent files mode- lets you navigate last n files opened using ido
(require 'recentf)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open) ;; bind to C-x C-r
(recentf-mode t)
(setq recentf-max-saved-items 20) ; 20 files ought to be enough.
 
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))


;; code folding with hideshow mode.
;; uncomment to turn on hideshow and bind the key C-+ to toggle a
;; block. also binds M-+ to show all
;; (add-hook 'c-mode-common-hook   'hs-minor-mode)
;; (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; (add-hook 'java-mode-hook       'hs-minor-mode)
;; (add-hook 'lisp-mode-hook       'hs-minor-mode)
;; (add-hook 'perl-mode-hook       'hs-minor-mode)
;; (add-hook 'sh-mode-hook         'hs-minor-mode)
;; (add-hook 'python-mode-hook     'hs-minor-mode)
;; (add-hook 'js-mode-hook         'hs-minor-mode)
;; (global-set-key (kbd "C-+") 'hs-toggle-hiding)
;; (global-set-key (kbd "M-+") 'hs-show-all)

;; autopair for pair autocomplete
;; (add-to-list 'load-path "~/.emacs.d/autopair") ;; comment if autopair.el is in standard load path 
;; (require 'autopair)
;; (autopair-global-mode) ;; enable autopair in all buffers


;; ================================================================
;; # BINDINGS
;; Moving common emacs tasks to more usable key bindings

;; Dynamic expand (aka autocomplete) to a more usable binding
(global-set-key (kbd "<C-tab>") 'dabbrev-expand)


;; ================================================================
;; # OTHER TWEAKS
;; shouldn't even have to do these, but here they are.

;; smooth scroll
;; scroll one line at a time (less "jumpy" than defaults)    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time    
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Switching RE mode to a sane one
(require 're-builder)
(setq reb-re-syntax 'string)

;; System copy and paste works with kill ring
(setq x-select-enable-clipboard t)

;; try to get emacs to load faster...this is ridiculous
;; EUREKA!!! http://ubuntuforums.org/archive/index.php/t-183638.html
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))

;; emacs vc-hg not working properly
(setq vc-handled-backends nil) 

;; make emacs retain hard links appropriatly
(setq backup-by-copying 1)

;; set python block comment prefix
(defvar py-block-comment-prefix "##")

;; use js-mode for jsons
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
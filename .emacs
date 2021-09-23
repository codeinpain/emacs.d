(setq byte-compile-warnings '(cl-functions))
;; melpa
(load "~/.emacs.d/load-directory")


(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(require 'simple-httpd)
;; set root folder for httpd server
(setq httpd-root "/home/lacaster/Code")

(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#111111" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("80d5a22931c15756b00fb258b80c93b8bc5096bb698dadfb6155ef3550e1c8fb" default))
 '(fci-rule-color "#3C3D37")
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(inhibit-startup-screen t)
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   '(processing-mode lsp-mode dap-mode add-node-modules-path exec-path-from-shell flymake-jslint flymake-easy skewer-mode vue-mode helm-sage web-narrow-mode evil-matchit evil-multiedit evil-commentary stylus-mode simple-httpd undo-tree git-gutter neotree popwin direx company-phpactor company-php phpactor php-runtime php-eldoc flycheck-inline flycheck-title flycheck-pos-tip flycheck-color-mode-line flycheck-phpstan flycheck ## origami vimish-fold key-chord evil-tabs evil-collection evil use-package dired-sidebar web-mode-edit-element sml-mode auto-complete fuzzy-finder fzf yasnippet-snippets yasnippet web-mode emmet-mode rjsx-mode all-the-icons org sage-shell-mode writeroom-mode monokai-theme ibuffer projectile flx-ido js2-mode))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#111111")
 '(sage-shell-view-default-resolution 250)
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#111111" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-background-face ((t (:background "#000" :box (:line-width 1 :color "black" :style released-button)))))
 '(elscreen-tab-control-face ((t (:background "black" :foreground "black" :box (:line-width 1 :color "black" :style released-button) :underline "black"))))
 '(elscreen-tab-current-screen-face ((t (:background "black" :foreground "white"))))
 '(elscreen-tab-other-screen-face ((t (:background "#2c2f3f" :foreground "Gray75"))))
 '(hl-line ((t (:extend t :background "#1f212d"))))
 '(line-number-current-line ((t (:inherit default :background "#111111" :foreground "#fff42b" :underline nil))))
 '(mode-line ((t (:background "#2c2f3f" :foreground "grey60" :box (:line-width 1 :color "#2c2f4f")))))
 '(popup-scroll-bar-background-face ((t (:background "#2c2f3f"))))
 '(show-paren-match ((t (:background "#111111" :foreground "light goldenrod" :inverse-video t :weight normal))))
 '(tab-bar-tab ((t (:inherit tab-bar :box (:line-width 1 :color "black" :style released-button)))))
 '(vertical-border ((t (:foreground "#1f212d")))))


;; Backup and Autosave Directories
(setq temporary-file-directory "~/.tmp/")
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(load "~/.emacs.d/melpa")
(load "~/.emacs.d/commands")
(load "~/.emacs.d/customs")
(load "~/.emacs.d/evil")
(load "~/.emacs.d/theme")
(load "~/.emacs.d/plugins")
(load "~/.emacs.d/special_commands")

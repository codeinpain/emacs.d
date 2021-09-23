;; Theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq ;; foreground and background
  monokai-background     "#111111"
)

(load-theme 'monokai t)

;; Custom configurações

(setq nihibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(display-line-numbers-mode)
(global-display-line-numbers-mode)
(setq-default line-spacing 0.55)

;; 
(set-cursor-color "#fff42b")
(set-face-attribute 'region nil :background "#2c2f3f")
;;

(face-spec-set 'mode-line
  '((((class color) (min-colors 88))
     :box (:line-width -1 :style released-button)
     :background "#2c2f3f" :foreground "black")
    (t
     :inverse-video t)))

(toggle-scroll-bar -1)
(global-hl-line-mode +1)

(setq js-indent-level 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default c-basic-indent 2)

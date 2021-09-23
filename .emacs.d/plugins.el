

(add-hook 'sage-shell:sage-mode-hook 'ac-sage-setup)
(add-hook 'sage-shell-mode-hook 'ac-sage-setup)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
(add-hook 'sage-shell-mode-hook #'eldoc-mode)
(add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

;; Projectile
(projectile-mode +1)
;(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
;(setq projectile-project-search-path '("~/Code/"))

;; iBuffer
(global-set-key (kbd "M-p") 'ibuffer)

;; Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; emmet mode
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

;; yasnipeet
(add-to-list 'load-path
	     "~/.emacs.d/snippets/")

   (require 'yasnippet)
   (yas-global-mode 1)

(define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)

;; auto-complete
(ac-config-default)

;; elscreen
(elscreen-start)

;; Web mode
(require 'web-mode)


(setq-default indent-tabs-mode nil)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)

;; Popwin
(popwin-mode 1)

;; Neotree

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name)))
        (message "Could not find git project root."))))


(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
 (global-set-key (kbd "M-n")  'neotree-project-dir)
(setq neo-window-width 40)


(global-origami-mode t)


;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(with-eval-after-load 'flycheck
  (flycheck-title-mode))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; php

(use-package phpactor :ensure t)
(use-package company-phpactor :ensure t)



(use-package php-mode
  ;;
  :hook ((php-mode . (lambda () (set (make-local-variable 'company-backends)
       '(;; list of backends
         company-phpactor
         company-files
         ))))))



(add-hook 'php-mode-hook
          (lambda ()
            (make-local-variable 'eldoc-documentation-function)
            (setq eldoc-documentation-function
                  'phpactor-hover)))

;(with-eval-after-load 'php-mode
;  (phpactor-smart-jump-register))

(with-eval-after-load 'php-mode
  (define-key php-mode-map (kbd "M-.") #'phpactor-goto-definition)
  (define-key php-mode-map (kbd "M-?") #'phpactor-find-references))

;; php mode

;; git marcadores
(global-git-gutter-mode +1)

;; Undo-tree
(global-undo-tree-mode)

;; skewer
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)


(show-paren-mode 1)


;; Evil commentary
(evil-commentary-mode)

;; Vue mode
(setq vue-mode-packages
  '(vue-mode))

(setq vue-mode-excluded-packages '())

(defun vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode))

;; Skewer
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; Sage Math
(setq sage-shell:sage-root "~/Programas/SageMath")
(add-hook 'sage-shell-after-prompt-hook #'sage-shell-view-mode)

(sage-shell:define-alias)
(setq sage-shell:input-history-cache-file "~/.emacs.d/.sage_shell_input_history")


;; (with-eval-after-load 'sage-mode
;;   (define-key sage-mode-map (kbd "M-e") #'sage-shell-edit:send-buffer))

(add-hook 'sage-shell-mode-hook
    (lambda ()
        (define-key sage-mode-map (kbd "M-b") 'sage-shell-edit:send-buffer)
        (define-key sage-mode-map (kbd "M-r") 'sage-shell-edit:send-region)
        (define-key sage-mode-map (kbd "M-L") 'sage-shell-edit:send-line)
    )
)

;; flymake
(add-hook 'js-mode-hook 'flymake-jslint-load)

(eval-after-load 'flycheck
   '(flycheck-add-mode 'html-tidy 'web-mode))

(use-package flycheck-indicator
  :hook (flycheck-mode . flycheck-indicator-mode))
;; Disable default fringe styling
(setq +vc-gutter-default-style nil)
;; Make sure the margin is visible to begin with
(setq-default left-margin-width 1)
;; Move flycheck to left margin
(setq-default flycheck-indication-mode 'left-margin)


;; https://emacs.stackexchange.com/questions/14898/flycheck-with-eslint-doesnt-use-eslintrc
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode))

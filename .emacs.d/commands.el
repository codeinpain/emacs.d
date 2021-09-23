(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  )

;; key binding
(global-set-key (kbd "C-<f5>") 'writeroom-mode)
(global-set-key (kbd "M-1") (lambda() (interactive)(find-file "~/.emacs.d/theme.el")))
(global-set-key (kbd "M-2") (lambda() (interactive)(find-file "~/.emacs.d/commands.el")))
(global-set-key (kbd "M-3") (lambda() (interactive)(find-file "~/.emacs.d/plugins.el")))
(global-set-key (kbd "M-4") (lambda() (interactive)(find-file "~/.emacs.d/evil.el")))
(global-set-key (kbd "M-5") (lambda() (interactive)(find-file "~/.emacs.d/special_commands.el")))
(global-set-key (kbd "M-0") (lambda() (interactive)(find-file "~/.emacs")))

(global-set-key (kbd "M-o") (lambda() (interactive)(find-file "~/Anotacoes/main.org")))

;; fzf
(global-set-key (kbd "M-f") 'fzf)

;; auto-indent
(global-set-key "\C-m" 'newline-and-indent)

;; ido mode
(ido-mode 1)
(setq ido-separator "\n")

;; Switch last buffer
(global-set-key (kbd "C-<tab>") 'previous-buffer)
(global-set-key (kbd "<C-iso-lefttab>") 'next-buffer)


;; zoom in/out like we do everywhere else.

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Abre orgmode

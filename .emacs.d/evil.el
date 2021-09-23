;; evil
;; (require 'evil)
;; (evil-mode 1)


(global-evil-tabs-mode t)

(evil-set-leader 'normal "," t)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)))

(defun insert-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1)))


(evil-define-key 'normal emacs-lisp-mode-map (kbd "M-s") 'eval-buffer)
(define-key evil-normal-state-map (kbd "C-o") (kbd ":only"))
(define-key evil-normal-state-map (kbd "C-t") (kbd ":tabnew"))

(define-key evil-normal-state-map  (kbd "M-l")  (kbd ":tabn"))
(define-key evil-normal-state-map  (kbd "M-h")  (kbd ":tabp"))

(evil-define-key 'insert global-map (kbd "M-l") 'evil-forward-char)
(evil-define-key 'insert global-map (kbd "M-j") 'evil-next-line)
(evil-define-key 'insert global-map (kbd "M-k") 'evil-previous-line)
(evil-define-key 'insert global-map (kbd "M-h") 'evil-backward-char)

(evil-set-undo-system 'undo-tree)


;; evil multiedit

;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-m") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-m") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-m") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-M") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-M") 'evil-multiedit-match-and-prev)

;; evil match it
(global-evil-matchit-mode 1)


;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command reminders
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reload config lines using `gr' on selected lines


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(toggle-frame-fullscreen)
(assq-delete-all 'mouse-wheel-down-event load-history)

;; `lsp-haskell' use "haskell-language-server-wrapper" by default, although the
;; Plutus nix-shell requires us to use "haskell-language-server"
;; See https://github.com/input-output-hk/plutus/blob/master/doc/plutus/troubleshooting.rst
(setq lsp-haskell-server-path "haskell-language-server")

;; Change color of comments
(set-face-foreground 'font-lock-comment-face "green")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package! centered-window
  :init
  (centered-window-mode t)
  (defcustom cmw-centered-window-width
    80
    "Minimum column length required to apply the margins."
    :group 'centered-window-mode)
  (defadvice load-theme (after cwm-set-faces-on-load-theme activate)
    "Change the default fringe background whenever these changes."
    (cwm-update-fringe-background))
  :ensure t)

(use-package! evil-commentary
  :ensure t
  :config
  (define-key evil-visual-state-map (kbd "C-/") 'evil-commentary)
  )

(use-package! psc-ide
  :config
  (customize-set-variable 'psc-ide-rebuild-on-save t)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook! 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)

(define-key evil-normal-state-map (kbd "C-u") 'split-window-horizontally)
;; Without `<KEY>' it doesn't work. Others with <> brackents don't work, so this one is special
(define-key evil-normal-state-map (kbd "<C-i>") 'split-window-vertically)


(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))
(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height))
  (previous-line (window-half-height)))
(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height))
  (forward-line (window-half-height)))

(define-key evil-normal-state-map (kbd "C-d") 'scroll-up-half)
(define-key evil-normal-state-map (kbd "C-f") 'scroll-down-half)

;; (define-key evil-normal-state-map (kbd "C-c j") 'tide-jump-to-definition)
(define-key evil-normal-state-map (kbd "C-c k") 'neotree-find)
(define-key evil-normal-state-map (kbd "C-,") 'previous-buffer)
(define-key evil-normal-state-map (kbd "C-.") 'next-buffer)

(map! :leader
      :desc "Toggle neotree"
      "d" #'neotree-toggle)

(map! :leader
      :desc "Scroll line to center"
      "SPC" #'evil-scroll-line-to-center)

(define-key evil-normal-state-map (kbd "C-S-p") 'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

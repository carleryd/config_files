;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Command reminders
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reload config lines using `gr' on selected lines


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set screen size to max without the OSX fullsize behavior
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(assq-delete-all 'mouse-wheel-down-event load-history)

;; Font size
(set-face-attribute 'default nil :height 130)

;; `lsp-haskell' use "haskell-language-server-wrapper" by default, although the
;; Plutus nix-shell requires us to use "haskell-language-server"
;; See https://github.com/input-output-hk/plutus/blob/master/doc/plutus/troubleshooting.rst
(setq lsp-haskell-server-path "haskell-language-server")

;; Fix tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Disable smartparens so that you don't get double quotes, parens etc
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Load environment variables used in shell
(use-package! exec-path-from-shell
   :config (exec-path-from-shell-initialize))

(defadvice flycheck-error-list-refresh (around shrink-error-list activate)
  ad-do-it
  (-when-let (window (flycheck-get-error-list-window t))
    (with-selected-window window
      (fit-window-to-buffer window 30))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; accept completion from copilot and fallback to company
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ("<tab>" . 'copilot-accept-completion)
;;               ("TAB" . 'copilot-accept-completion)
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))

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
  )

(use-package! evil-commentary
  :config
  (define-key evil-visual-state-map (kbd "C-/") 'evil-commentary)
  )

(use-package! psc-ide
  :config
  (customize-set-variable 'psc-ide-rebuild-on-save t)
  )

(use-package! neotree
  :config
  (setq neo-show-hidden-files nil)
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

(eval-after-load "typescript" `(add-hook! 'typescript-mode-hook
                                 (lambda ()
                                   (setq tab-width 2)
                                   )
                                 )
                 )

(eval-after-load "flycheck" `(add-hook! 'flycheck-mode-hook #'flycheck-inline-mode))

;; Prevent modes from formatting and leave that to prettier
(add-hook! 'html-mode-hook 'prettier-js-mode)
(add-hook! 'json-mode-hook 'prettier-js-mode)
(add-hook! 'rjsx-mode-hook 'prettier-js-mode)
(add-hook! 'typescript-mode-hook 'prettier-js-mode)
(add-hook! 'typescript-mode-hook 'rainbow-mode)
(add-hook! 'prisma-mode-hook 'prettier-js-mode)




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
  (scroll-up 15)
  (previous-line (window-half-height)))
(defun scroll-down-half ()
  (interactive)
  (scroll-down 15)
  (forward-line (window-half-height)))

(define-key evil-normal-state-map (kbd "C-d") 'scroll-up-half)
(define-key evil-normal-state-map (kbd "C-f") 'scroll-down-half)

(define-key evil-normal-state-map (kbd "C-c j") 'evil-goto-definition)
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

;; Useful for checking Haskell type definitions
(define-key evil-normal-state-map (kbd "C-c i") 'lsp-describe-thing-at-point)

(define-key evil-normal-state-map (kbd "C-c g") 'magit)

;; Remove useless commands making my life difficult
;; (global-unset-key (kbd "C-z")) this didn't work :(

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

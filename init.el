(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)

(load-theme 'deeper-blue)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editor settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook '(lambda () (set-frame-size (selected-frame) 170 60)))
; disable the menu bar
(menu-bar-mode -1)
; disable the scrollbar
(toggle-scroll-bar -1)
; disable the toolbar
(tool-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (global-evil-leader-mode)
  
  (use-package evil-leader
    :ensure t)
  
  (use-package evil-escape
    :ensure t
    :commands evil-escape-mode
    :init
    (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
          evil-escape-excluded-major-modes '(neotree-mode)
          evil-escape-key-sequence "jk"
          evil-escape-delay 0.05)
    (add-hook 'after-init-hook #'evil-escape-mode)
    :config
    ;; no `evil-escape' in minibuffer
    (cl-pushnew #'minibufferp evil-escape-inhibit-functions :test #'eq)

    (define-key evil-insert-state-map  (kbd "C-g") #'evil-escape)
                                        ; (define-key evil-replace-state-map (kbd "C-g") #'evil-escape)
                                        ; (define-key evil-visual-state-map  (kbd "C-g") #'evil-escape)
                                        ; (define-key evil-motion-state-map  (kbd "C-g") #'evil-escape)
                                        ; (define-key evil-operator-state-map (kbd "C-g") #'evil-escape)
                                        ; (define-key evil-window-map  (kbd "C-g") #'evil-escape)
    )

  (use-package evil-numbers
    :ensure t)

  (use-package evil-magit
    :ensure t)

  )

(use-package neotree
  :ensure t
  :config
  
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))))

(use-package company
  :ensure t
  :init
  (setq company-dabbrev-downcase nil
        company-idle-delay 0
        )
  )

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))


;(autoload 'helm-company "helm-company") ;; Not necessary if using ELPA package
;(eval-after-load 'company
  ;'(progn
     ;(define-key company-mode-map (kbd "C-:") 'helm-company)
     ;(define-key company-active-map (kbd "C-:") 'helm-company)))


; ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
; ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
; ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
; (global-set-key (kbd "C-c h") 'helm-command-prefix)
; (global-unset-key (kbd "C-x c"))
; 
; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
; 
; (when (executable-find "curl")
;   (setq helm-google-suggest-use-curl-p t))
; 
; 
; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;       helm-ff-file-name-history-use-recentf t
;       helm-echo-input-in-header-line t)

(use-package projectile
  :ensure t
  :defer t
  :config
  (projectile-global-mode))
(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :ensure t
  :config
  (evil-leader/set-key
    "ps" 'helm-projectile-ag
    "pa" 'helm-projectile-find-file-in-known-projects
  ))
(use-package js3-mode
  :init
  :ensure t)
(use-package web-mode
   :init
   (progn
     (setq web-mode-enable-current-element-highlight t)
     (setq web-mode-enable-current-column-highlight t)
     (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
     (setq web-mode-content-types-alist '(("scss" . "\\.css[x]?\\'")))
     (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
     (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
     (defun my-web-mode-hook ()
       "Hooks for Web mode."
       (setq web-mode-markup-indent-offset 2)
       (setq web-mode-css-indent-offset 2)
       (setq web-mode-code-indent-offset 2)
       (setq web-mode-style-padding 1)
       (setq web-mode-script-padding 1)
       (setq web-mode-block-padding 0)
       )
     (add-hook 'web-mode-hook 'my-web-mode-hook)
     (eval-after-load "web-mode"
       '(set-face-background 'web-mode-current-element-highlight-face "color-88"))
     )
    :ensure t)
;(use-package rjsx-mode
;  :ensure t)
(use-package flycheck
  :ensure t)
;(use-package flow-minor-mode
  ;:ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package tide
  :ensure t)
(use-package alchemist
  :ensure t)
(use-package php-mode
  :ensure t)
(use-package magit
  :ensure t)
(use-package prettier-js
  :init
  (add-hook 'js3-mode-hook '-js-mode)
  :ensure t)
(use-package solidity-mode
  :ensure t)
(use-package purescript-mode
  :ensure t)
(use-package psc-ide
  :init
  (add-hook 'purescript-mode-hook
  (lambda ()
    (psc-ide-mode)
    (company-mode)
    (flycheck-mode)
    (turn-on-purescript-indentation)))
  (setq psc-ide-use-npm-bin t)
  :ensure t)

(setq inhibit-startup-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Require Installed Packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; (require 'helm-config)
; (require 'evil)
; (require 'evil-numbers)
; (require 'js3-mode)
; (require 'web-mode)
; ;(require 'rjsx-mode)
; (require 'flycheck)
; ;(require 'flow-minor-mode)
; (require 'exec-path-from-shell)
; (require 'tide)
; (require 'alchemist)
; (require 'php-mode)
; (require 'magit)
; (require 'evil-magit)
; (require 'prettier-js)
; (require 'solidity-mode)
(require 'psc-ide)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up hooks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)
; (add-hook 'js3-mode-hook 'flow-minor-enable-automatically)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.css\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(setq-default indent-tabs-mode nil)

; (defun web-indent-hook ()
;   "Hook for setting indent width on different files."
;   (setq web-mode-markup-indent-offset 2)
;   (setq web-mode-script-padding 2)
;   (setq web-mode-css-indent-offset 2)
;   (setq web-mode-code-indent-offset 2)
; )
; (add-hook 'web-mode-hook 'web-indent-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ????
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-u") 'split-window-horizontally)
(define-key evil-normal-state-map (kbd "C-i") 'split-window-vertically)
(define-key evil-normal-state-map (kbd "C-f") 'split-window-vertically)
(define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-line-to-center)
(define-key evil-normal-state-map (kbd "C-c f") 'helm-ag-project-root)
(define-key evil-normal-state-map (kbd "C-c g") 'magit-status)
(define-key evil-normal-state-map (kbd "C-c b") 'magit-blame)
(evil-define-key 'normal magit-mode-map (kbd "C-h") 'windmove-left)
(evil-define-key 'normal magit-mode-map (kbd "C-l") 'windmove-right)
(evil-define-key 'normal magit-mode-map (kbd "C-k") 'windmove-up)
(evil-define-key 'normal magit-mode-map (kbd "C-j") 'windmove-down)
(evil-define-key 'normal magit-mode-map (kbd "SPC") 'evil-scroll-line-to-center)
(evil-define-key 'normal magit-mode-map (kbd "C-[") 'evil-escape)

(global-set-key (kbd "C-a") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-`") 'evil-numbers/dec-at-pt)

(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))
(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))
(defun scroll-down-half ()         
  (interactive)                    
  (scroll-down (window-half-height)))
(define-key evil-normal-state-map (kbd "C-d") 'scroll-up-half)
(define-key evil-normal-state-map (kbd "C-f") 'scroll-down-half)
(evil-define-key 'normal magit-mode-map (kbd "C-d") 'scroll-up-half)
(evil-define-key 'normal magit-mode-map (kbd "C-f") 'scroll-down-half)

(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))
(global-set-key (kbd "C-c I") 'find-user-init-file)

(evil-leader/set-key "d" 'neotree-toggle)
(evil-leader/set-key "f" 'buffer-menu)

(evil-add-hjkl-bindings occur-mode-map 'emacs
  (kbd "/")       'evil-search-forward
  (kbd "n")       'evil-search-next
  (kbd "N")       'evil-search-previous
  (kbd "C-d")     'evil-scroll-down
  (kbd "C-u")     'evil-scroll-up
  (kbd "C-w C-w") 'other-window)

(with-eval-after-load 'evil
  ;; use evil mode in the buffer created from calling `list-packages'.
  (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))

  (with-eval-after-load 'package
    ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
    ;; mark, unmark, install
    (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
    (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
    (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ### OTHER STUFF ###
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~ [[ General ]] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;; Disable tool bar
(tool-bar-mode -1)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~ [[ TypeScript ]] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; Linting .tsx
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~~~ [[ ESLint ]] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;; use local eslint from node_modules before global
; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
;; (defun my/use-eslint-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;;                 (or (buffer-file-name) default-directory)
;;                 "node_modules"))
;;          (eslint (and root
;;                       (Expand-file-name "node_modules/eslint/bin/eslint.js"
;;                                         root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


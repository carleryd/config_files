;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("org" . "http://orgmode.org/elpa/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (orgmode org-mode javascript-eslint nix-mode go-mode gnugo moe-theme evil-collection-vc-annotate centered-window centered-window-mode centered-windowmode elm-mode haskell-mode web-mode use-package tide solidity-mode purescript-mode psc-ide prettier-js php-mode neotree js3-mode indium helm-projectile helm-ag exec-path-from-shell evil-surround evil-numbers evil-magit evil-leader evil-escape evil-commentary editorconfig alchemist ag add-node-modules-path))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#181a26")))))

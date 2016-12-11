;;-------------------------------------------------------------------------------------
;;packege.el
;;-------------------------------------------------------------------------------------
(require 'package)
;; 初期化
(package-initialize)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))

;;-------------------------------------------------------------------------------------
;; cask
;;-------------------------------------------------------------------------------------
(require 'cask "/usr/local/opt/cask/cask.el")
(cask-initialize)
(require 'pallet)

;;-------------------------------------------------------------------------------------
;; init-loader
;;-------------------------------------------------------------------------------------
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/dotfiles/emacs.d/inits")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-list-file-name nil t)
 '(auto-save-list-file-prefix nil)
 '(delete-auto-save-files t)
 '(package-selected-packages
   (quote
    (go-complete evil-smartparens haskell-mode yasnippet yaml-mode web-mode wakatime-mode use-package smex smartparens ruby-electric ruby-block rhtml-mode recentf-ext projectile-rails prodigy popwin php-mode pallet nyan-mode multiple-cursors magit lua-mode init-loader idle-highlight-mode htmlize helm go-mode go-autocomplete fuzzy flycheck-cask expand-region exec-path-from-shell drag-stuff coffee-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------------------------------------------------------------
;;packege.el
;;-------------------------------------------------------------------------------------
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;;-------------------------------------------------------------------------------------
;; cask
;;-------------------------------------------------------------------------------------
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

;;-------------------------------------------------------------------------------------
;; init-loader
;;-------------------------------------------------------------------------------------
(require 'init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/dotfiles/emacs.d/inits")

;;-------------------------------------------------------------------------------------
;; ロードパス
;;-------------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

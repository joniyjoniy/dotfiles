;; --- package.el ---
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; --- cask ---
(require 'cask)
(cask-initialize)
(require 'pallet)
;; --- init loader ---
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
 '(custom-safe-themes
   (quote
    ("0b7ee9bac81558c11000b65100f29b09488ff9182c083fb303c7f13fd0ec8d2b" default)))
 '(delete-auto-save-files t)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(package-selected-packages
   (quote
    (auto-package-update apib-mode plantuml-mode gnuplot-mode helm-projectile geben-helm-projectile flycheck-pos-tip flycheck-popup-tip rjsx-mode terraform-mode madhat2r-theme arjen-grey-theme json-mode go-complete evil-smartparens haskell-mode yasnippet yaml-mode web-mode wakatime-mode use-package smex smartparens ruby-electric ruby-block rhtml-mode recentf-ext projectile-rails prodigy popwin php-mode pallet nyan-mode multiple-cursors magit lua-mode init-loader idle-highlight-mode htmlize helm go-mode go-autocomplete fuzzy flycheck-cask expand-region exec-path-from-shell drag-stuff coffee-mode)))
 '(terraform-indent-level 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

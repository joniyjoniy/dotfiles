;; --- exec-path-from-shell ---
(let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs))

;; --- flycheck ---
(require 'flycheck)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin/"))
(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-cask-setup)
  (flycheck-pos-tip-mode))

;; --- smartparens ---
(require 'smartparens-config)
(smartparens-global-mode t)

;; --- helm  ---
;; search anything
(require 'helm)
(require 'helm-config)
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-inside-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)
(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 40)
(helm-autoresize-mode 1)
(helm-mode 1)

;; --- auto-complete ---
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(require 'fuzzy)
(ac-config-default)
(add-to-list 'ac-modes 'slim-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'yatex-mode)
;; C-n/C-pで候補選択
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

;; --- projectile ---
(require 'projectile)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(require 'helm-projectile)
(helm-projectile-on)

;; ----
(provide '01_corepackages)
;;; 01_corepackages.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

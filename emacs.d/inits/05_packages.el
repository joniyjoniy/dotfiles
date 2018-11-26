;; --- go-mode ---
(require 'go-mode)
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)
     (require 'auto-complete-config)
     (ac-config-default)))
(add-hook 'before-save-hook 'gofmt-before-save)

;; --- rjsx-mode ---
(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq js-indent-level 2)
            (setq js2-strict-missing-semi-warning nil)))

;; --- json-mode ---
(require 'json-mode)
(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 2)))

;; --- terraform-mode ---
(require 'terraform-mode)
(custom-set-variables
  '(terraform-indent-level 4))

;; --- ruby-mode ---
(when (require 'ruby-mode nil t)
  ;; off to insert encoding: utf-8
  (defun ruby-mode-set-encoding () ())
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  (require 'ruby-electric)
  (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
  (setq ruby-electric-expand-delimiters-list nil)
  (defun ruby-insert-end ()
    (interactive)
    (insert "end")
    (end-of-line))
  ;; (require 'ruby-block)
  (setq ruby-block-heilight-toggle t))

;; --- rails ---
(require 'rhtml-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(require 'recentf-ext)
(setq recentf-max-saved-items 5000)

;; --- coffee-scripts ---
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '(".cjsx$" . coffee-mode))

;; --- lua-mode ---
(require 'lua-mode)
;;lua-modeの設定
(setq lua-indent-level 2)

;; --- php-mode ---
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq tab-width 2)
             (setq c-basic-offset 2)
             (setq indent-tabs-mode t)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             ))

;; ----
(provide '05_packages)
;;; 05_packages.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

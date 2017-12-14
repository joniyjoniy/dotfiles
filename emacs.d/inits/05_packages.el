;; --------------------------
;; exec-path-from-shell
;;--------------------------
(let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs))

;;--------------------------
;; smartparens
;;--------------------------
(require 'smartparens-config)
(smartparens-global-mode t)

;;--------------------------
;;helm
;;--------------------------
(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x") 'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action))

;;--------------------------
;; auto-complete
;;--------------------------
(when (require 'auto-complete nil t)
  (require 'auto-complete-config)
  (global-auto-complete-mode t)
  (require 'fuzzy)
  (ac-config-default)
  (add-to-list 'ac-modes 'slim-mode)
  (add-to-list 'ac-modes 'fundamental-mode)
  (add-to-list 'ac-modes 'yatex-mode)
  ;; C-n/C-pで候補選択
  (setq ac-use-menu-map t)
  (setq ac-use-fuzzy t))
;;--------------------------
;; ruby
;;--------------------------
(when (require 'ruby-mode nil t)
  ;; ruby-mode でencoding: utf-8 自動挿入をOFFにする
  (defun ruby-mode-set-encoding () ())
  ;; ハイライトするファイルの種類を追加
  (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
  ;; ruby-electric
  (require 'ruby-electric)
  (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
  (setq ruby-electric-expand-delimiters-list nil)
  ;; end対策
  (defun ruby-insert-end ()
    (interactive)
    (insert "end")
    (ruby-indent-line t)
    (end-of-line))
  ;; ruby-block
  (require 'ruby-block)
  (ruby-block-mode t)
  (setq ruby-block-heilight-toggle t))

;;--------------------------
;; rails
;;--------------------------
(require 'rhtml-mode)
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '(".cjsx$" . coffee-mode))
;; projective-rails
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)
(require 'recentf-ext)
(setq recentf-max-saved-items 5000)

;;--------------------------
;; web-mode
;;--------------------------
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
;; web-modeの設定
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-comment-style 2)
  (setq web-mode-engines-alist
        '(("php"    . "\\.ctp\\'")))
  )
;;--------------------------
;; lua-mode
;;--------------------------

(require 'lua-mode)
;;lua-modeの設定
(setq lua-indent-level 2)

;;--------------------------
;; json-mode
;;--------------------------

(require 'json-mode)
;;json-modeの設定
(add-hook 'json-mode-hook
          (lambda ()
            (setq js-indent-level 2)))

;;--------------------------
;; terraform-mode
;;--------------------------

(require 'terraform-mode)
;;terraform-modeの設定
(custom-set-variables
  '(terraform-indent-level 4))

;;--------------------------
;; go-mode
;;--------------------------
(require 'go-mode)
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)
     (require 'auto-complete-config)
     (ac-config-default)))
(add-hook 'before-save-hook 'gofmt-before-save)

;;--------------------------
;; php-mode
;;--------------------------

(require 'php-mode)
;;php-modeの設定
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")
             (setq tab-width 2)
             (setq c-basic-offset 2)
             (setq indent-tabs-mode t)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             ;;(setq php-mode-force-pear t)
             ))

;;--------------------------
;; flycheck
;;--------------------------
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(require 'flycheck-pos-tip)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(eval-after-load 'flycheck
  '(custom-set-variables
  '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
(add-to-list 'exec-path (expand-file-name "/usr/local/go/bin/"))
;;--------------------------
;; wakatime-mode
;;--------------------------
(global-wakatime-mode)

(provide '05_packages)
;;; 05_packages.el ends here

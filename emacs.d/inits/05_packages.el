;;-------------------------------------------------------------------------------------
;; use-package
;;-------------------------------------------------------------------------------------
(require 'use-package)

;;-------------------------------------------------------------------------------------
;;helm
;;-------------------------------------------------------------------------------------
(use-package helm-config)
:bind (("C-x C-b" . helm-mini)
;;        ("M-y" . helm-show-kill-ring)
;;        ("TAB" . helm-execute-persistent-action)
        )
;;(global-set-key (kbd "C-x C-b") 'helm-mini)
(helm-mode t)
;; M-yでキルリングの履歴一覧を表示
;;(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; helm modeでもC-hでバックスペース
;;(define-key helm-map (kbd "\C-h") 'delete-backward-char)
;; tabでディレクトリ移動
;;(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;;-------------------------------------------------------------------------------------
;; auto-complete
;;-------------------------------------------------------------------------------------
(use-package auto-complete)
(global-auto-complete-mode t)
(use-package auto-complete-config)
(use-package fuzzy)
(ac-config-default)
;; C-n/C-pで候補選択
(setq ac-use-menu-map t)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-mode-map (kbd "C-;") 'ac-fuzzy-complete)
(add-to-list 'ac-modes 'slim-mode 'rhtml-mode)

;;-------------------------------------------------------------------------------------
;; ruby
;;-------------------------------------------------------------------------------------
(use-package 'ruby-mode
  :commands ruby-mode
  :mode (("\\.rb$latex" . ruby-mode)
         ("Capfile$" . ruby-mode)
         ("Gemfile$" . ruby-mode))
  :interpreter "ruby")

;; (autoload 'ruby-mode "ruby-mode"
;;   "Mode for editing ruby source files" t)
;; ;; .rb Capfile GemfileをRubyファイルと認識
;; (add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; ruby-electric
(use-package ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)
;; end対策
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
;; ruby-block
(use-package ruby-block)
(ruby-block-mode t)
(setq ruby-block-heilight-toggle t)

;;-------------------------------------------------------------------------------------
;; rails
;;-------------------------------------------------------------------------------------
(use-package rhtml-mode)
(use-package coffee-mode)
;; projective-rails
(use-package projectile)
(projectile-global-mode)
(use-package projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)
(use-package recentf-ext)
(setq recentf-max-saved-items 5000)

;;-------------------------------------------------------------------------------------
;; web-mode
;;-------------------------------------------------------------------------------------
(use-package web-mode)
;; web-modeの設定
(defun web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-engines-alist
        '(("php"    . "\\.ctp\\'"))
        )
  )

;;-------------------------------------------------------------------------------------
;; lua-mode
;;-------------------------------------------------------------------------------------
(use-package lua-mode)
;;lua-modeの設定
(setq lua-indent-level 2)

;;-------------------------------------------------------------------------------------
;; twitter
;;-------------------------------------------------------------------------------------
;; (use-package twittering-mode)
;; (setq twittering-)

;;-------------------------------------------------------------------------------------
;; snippet
;;-------------------------------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
;; (use-package yasnippet)
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; (yas-global-mode 1)
;; 既存スニペットを挿入する
;; (define-key yas-minor-mode-map (kbd "C-x i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
;; (define-key yas-minor-mode-map (kbd "C-x n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
;; (define-key yas-minor-mode-map (kbd "C-x v") 'yas-visit-snippet-file)

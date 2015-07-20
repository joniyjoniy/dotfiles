;;-------------------------------------------------------------------------------------
;;helm
;;-------------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/helm")
(global-set-key (kbd "C-x C-b") 'helm-mini)
(require 'helm-config)
(helm-mode t)
;; M-yでキルリングの履歴一覧を表示
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
;; helm modeでもC-hでバックスペース
(define-key helm-map (kbd "\C-h") 'delete-backward-char)
;; tabでディレクトリ移動
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


;;-------------------------------------------------------------------------------------
;; auto-complete
;;-------------------------------------------------------------------------------------
(require 'auto-complete)
(global-auto-complete-mode t)
(require 'auto-complete-config)
(require 'fuzzy)
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
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
;; .rb Capfile GemfileをRubyファイルと認識
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
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
(setq ruby-block-heilight-toggle t)


;;-------------------------------------------------------------------------------------
;; rails
;;-------------------------------------------------------------------------------------
(require 'rhtml-mode)
(require 'coffee-mode)
;; projective-rails
(require 'projectile)
(projectile-global-mode)
(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq echo-keystrokes 0.1)
(setq projectile-completion-system 'grizzl)
(require 'recentf-ext)
(setq recentf-max-saved-items 5000)

;;-------------------------------------------------------------------------------------
;; web-mode
;;-------------------------------------------------------------------------------------
(require 'web-mode)
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
(require 'lua-mode)
;;lua-modeの設定
(setq lua-indent-level 2)

;;-------------------------------------------------------------------------------------
;; cua-mode
;; C-z がUndoになる原因らしい
;;-------------------------------------------------------------------------------------
;;(cua-mode t)
;;(setq cua-mode-cua-keys nil)

;;-------------------------------------------------------------------------------------
;; twitter
;;-------------------------------------------------------------------------------------
;; (require 'twittering-mode)
;; (setq twittering-)

;;-------------------------------------------------------------------------------------
;; snippet
;;-------------------------------------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
;; (require 'yasnippet)
;; (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;; (yas-global-mode 1)
;; 既存スニペットを挿入する
;; (define-key yas-minor-mode-map (kbd "C-x i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
;; (define-key yas-minor-mode-map (kbd "C-x n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
;; (define-key yas-minor-mode-map (kbd "C-x v") 'yas-visit-snippet-file)

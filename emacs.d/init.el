;; ------------------------------------------------------------------------------------------------------------
;; 設定
;; ------------------------------------------------------------------------------------------------------------
;; 入力キー表示速度を早くする
(setq echo-keystrokes 0.1)
;; 行末の空白を保存時に削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; タブ幅
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil) ; 空白でインデント
;; 文字コード
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; 行番号表示
(global-linum-mode t)
(setq linum-format "%4d |")

;; 自動保存の設定
(custom-set-variables
 '(auto-save-default nil)          ; 自動保存しない
 '(auto-save-list-file-name nil)   ; 自動保存ファイルの名前を記録しない
 '(auto-save-list-file-prefix nil) ; 自動保存ファイルリストを初期化しない
 '(delete-auto-save-files t))      ; 自動保存ファイルを削除
;;バックアップファイルを作らない
(setq make-backup-files nil)
(setq auto-save-default nil)

;;-------------------------------------------------------------------------------------------------------------
;;packege.el
;;-------------------------------------------------------------------------------------------------------------
(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)

;;-------------------------------------------------------------------------------------------------------------
;; ロードパス
;;-------------------------------------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;-------------------------------------------------------------------------------------------------------------
;; 対応する記号を自動補完
;;-------------------------------------------------------------------------------------------------------------
;;(require 'smartparens-config)
;;(smartparens-global-mode t)

;;-------------------------------------------------------------------------------------------------------------
;; キーバインド
;;-------------------------------------------------------------------------------------------------------------
;; C-c C-cでコメントアウト
(define-key global-map "\C-c\C-c" 'comment-region)
;;  C-c C-uでアンコメント
 (define-key global-map "\C-c\C-u" 'uncomment-region)
;; C-uでundo
(define-key global-map "\C-u" 'undo)
;; C-hでバックスペース
(global-set-key "\C-h" 'backward-delete-char)
;; C-mで改行とインデント
(global-set-key "\C-m" 'newline-and-indent)

;;-------------------------------------------------------------------------------------------------------------
;; 補完
;;-------------------------------------------------------------------------------------------------------------
;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)

;;-------------------------------------------------------------------------------------------------------------
;;helm
;;-------------------------------------------------------------------------------------------------------------
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


;;-------------------------------------------------------------------------------------------------------------
;; auto-complete
;;-------------------------------------------------------------------------------------------------------------
;;(require 'auto-complete)
;;(global-auto-complete-mode t)
;;(require 'auto-complete-config)
;;(require 'fuzzy)
;;(ac-config-default)
;; C-n/C-pで候補選択
;;(setq ac-use-menu-map t)

;;(define-key ac-menu-map "\C-n" 'ac-next)
;;(define-key ac-menu-map "\C-p" 'ac-previous)
;;(define-key ac-mode-map (kbd "C-;") 'ac-fuzzy-complete)
;;(add-to-list 'ac-modes 'slim-mode 'rhtml-mode)


;;-------------------------------------------------------------------------------------------------------------
;; ruby
;;-------------------------------------------------------------------------------------------------------------
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


;;-------------------------------------------------------------------------------------------------------------
;; rails
;;-------------------------------------------------------------------------------------------------------------
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

;; -----------------------------------------------------------------------------------------------------------
;; twitter
;; -----------------------------------------------------------------------------------------------------------
;; (require 'twittering-mode)
;; (setq twittering-)

;; -----------------------------------------------------------------------------------------------------------
;; snippet
;; -----------------------------------------------------------------------------------------------------------
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

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)


;; web mode
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

;;-------------------------------------------------------------------------------------
;; 設定
;;-------------------------------------------------------------------------------------
;; 入力キー表示速度を早くする
(setq echo-keystrokes 0.1)
;; タブ幅
(setq-default tab-width 2)
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
;; 時刻表示
(display-time-mode 1)
;; カラーテーマ
(load-theme 'manoj-dark t)
;; 対応する括弧を強調
(show-paren-mode t)
(setq show-paren-delay 0)
;; 最終行に1行追加
(setq require-final-newline t)
;; 保存時に行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;-------------------------------------------------------------------------------------
;; 補完
;;-------------------------------------------------------------------------------------
;; バッファー名の問い合わせで大文字小文字の区別をしない
(setq read-buffer-completion-ignore-case t)
;; ファイル名の問い合わせで大文字小文字の区別をしない
(setq read-file-name-completion-ignore-case t)

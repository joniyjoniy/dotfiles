;;-------------------------------------------------------------------------------------
;; キーバインド
;;-------------------------------------------------------------------------------------
(bind-keys :map global-map
           ;; C-c C-cでコメントアウト
           ("C-c C-c" 'comment-dwim)
           ;;  C-c C-uでアンコメント
           ("C-c C-u" 'uncomment-region)
           ;; C-uでundo
           ("C-u" 'undo)
           ;; C-hでバックスペース
           ("C-h" 'backward-delete-char)
           ;; C-mで改行とインデント
           ("C-m" 'newline-and-indent)
           ;; C-x l でgoto-line
           ("C-xl" 'goto-line))

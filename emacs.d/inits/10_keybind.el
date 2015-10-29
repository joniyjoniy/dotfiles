;;-------------------------------------------------------------------------------------
;; キーバインド
;;-------------------------------------------------------------------------------------
;; C-c C-cでコメントアウト
(define-key global-map "\C-c\C-c" 'comment-dwim)
;;  C-c C-uでアンコメント
(define-key global-map "\C-c\C-u" 'uncomment-region)
;; C-x l でgoto-line
(define-key global-map "\C-x\C-l" 'goto-line)
;; C-uでundo
(define-key global-map "\C-u" 'undo)
;; C-hでバックスペース
(define-key global-map "\C-h" 'backward-delete-char)
;; C-mで改行とインデント
(global-set-key "\C-m" 'newline-and-indent)

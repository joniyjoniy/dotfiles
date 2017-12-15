;; --- keybind ---
;; this keybind is quite close to quit Emacs keybind
(global-unset-key (kbd "C-x c"))
(define-key global-map "\C-c\C-c" 'comment-dwim)
(define-key global-map "\C-x\C-l" 'goto-line)
(define-key global-map "\C-u" 'undo)
(define-key global-map "\C-h" 'backward-delete-char)
(global-set-key "\C-m" 'newline-and-indent)
;; helm key settings
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
; make TAB work in terminal
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
; list actions using C-z
(define-key helm-map (kbd "C-z")  'helm-select-action)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; ----
(provide '10_keybind)
;;; 10_keybind.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

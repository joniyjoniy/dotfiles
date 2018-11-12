;; --- base settings ---
(setq echo-keystrokes 0.1)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(display-time-mode 1)
(load-theme 'madhat2r t)
(show-paren-mode t)
(setq show-paren-delay 0)
(setq require-final-newline t)
;; --- charset ---
(set-language-environment "japanese")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; --- line-number ---
(global-linum-mode t)
(setq linum-format "%4d |")
;; --- auto-save ---
(custom-set-variables
 '(auto-save-default nil)
 '(auto-save-list-file-name nil)
 '(auto-save-list-file-prefix nil)
 '(delete-auto-save-files t))
(setq make-backup-files nil)
(setq auto-save-default nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; --- auto-completion ---
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; ---  wakatime-mode ---
;;(global-wakatime-mode)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

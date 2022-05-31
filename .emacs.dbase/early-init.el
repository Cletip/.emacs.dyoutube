;;; early-init.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Configuration à faire le plus tôt possible, est chargé automatiquement avant l'initialisation de l'interface

;; in ~/.emacs.d/init.el (or ~/.emacs.d/early-init.el in Emacs 27)
(setq package-enable-at-startup nil) ; don't auto-initialize!

;; prevent resize window on startup and boost a little speed
(setq frame-inhibit-implied-resize t)

;;basique
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tooltip-mode 0)

;;
;; Buffer *Messages* avec timestamp
;;
(defun cp/ad-timestamp-message (FORMAT-STRING &rest args)
  "Advice to run before `message' that prepends a timestamp to each message.
Activate this advice with:
  (advice-add 'message :before 'cp/ad-timestamp-message)
Deactivate this advice with:
  (advice-remove 'message 'cp/ad-timestamp-message)"
  (if message-log-max
      (let ((deactivate-mark nil)
            (inhibit-read-only t))
        (with-current-buffer "*Messages*"
          (goto-char (point-max))
          (if (not (bolp))
              (newline))
          (insert (format-time-string "[%F %T.%3N] "))))))
(advice-add 'message :before 'cp/ad-timestamp-message)

(setq-default inhibit-redisplay t
              inhibit-message t)
(add-hook 'window-setup-hook
          (lambda ()
            (setq-default inhibit-redisplay nil
                          inhibit-message nil)
            (redisplay)))

;; Contrary to what many Emacs users have in their configs, you don't need
;; more than this to make UTF-8 the default coding system:
(set-language-environment "UTF-8")

;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)

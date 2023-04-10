;;; .emacs --- Your emacs config -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; in ~/.emacs.d/init.el (or ~/.emacs.d/early-init.el in Emacs 27)
(setq package-enable-at-startup nil) ; don't auto-initialize!

;; configuration of straight
;; Bootstrap `straight.el'
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; installation of use-package
(straight-use-package 'use-package)
(require 'package)
;; always download package automatically (without :ensure t)
;;(setq use-package-always-ensure t)
;; Use straight.el for use-package expressions with the first line
(setq straight-use-package-by-default t)
;; Load the helper package for commands like `straight-x-clean-unused-repos'
(require 'straight-x)

;; voit le chargement des package + temps
(setq use-package-verbose t)
(setq use-package-minimum-reported-time 0.00001)

;; load les variables customiser (chemin définit par no-littering)
(use-package no-littering
  :config
  ;; définition de l'emplacement de certains fichiers
  (setq custom-file (no-littering-expand-var-file-name "custom.el")
	)
  )

;; Install org-mode
;;installation of org-mode
(use-package org :straight (org :type git :repo "https://code.orgmode.org/bzg/org-mode.git"))

;; chargement du reste de la config
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; the rest (like custom variable) is in custom.el

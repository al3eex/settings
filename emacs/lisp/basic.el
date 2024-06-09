;;; basic.el --- basic settings for Emacs quality of life -*- lexical-binding: t; -*-

;;; Code:

(use-package emacs
  :init
  ;; UTF-8 as default encoding
  (unless (display-graphic-p)
    (xterm-mouse-mode 1))
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8-unix)
  (progn
    ;; make indent commands use space only (never tab character)
    (setq-default indent-tabs-mode nil))
  (setq-default tab-width 4)
  (setq native-comp-async-report-warnings-errors 'silent)
  ;; stop crаeating those #auto-save# files
  (setq auto-save-default nil
	    create-lockfiles nil
	    make-backup-files nil)
  ;; Use y-n instead of yes-no
  (setq use-short-answers t)
  (tool-bar-mode -1)
  (fido-vertical-mode)
  ;; Highlight current line
  (global-hl-line-mode 1)
  ;; Stop cursor blinking
  (blink-cursor-mode 0)
  ;; Disable splash screen
  ;; (setq inhibit-startup-screen t)
  ;; Enable line numbering in `prog-mode'
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  (setq-default fill-column 80)
  (add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
  ;; do not decrease line number width, results in less shifting
  (setq-default display-line-numbers-grow-only t)
  ;; set line number width to a maximum needed number
  ;; (no shifting when scrolling)
  (setq-default display-line-numbers-width-start t)
  ;; (add-hook 'prog-mode-hook #'ruler-mode)
  (line-number-mode t)
  (column-number-mode t)
  ;; Save cursor place inside file
  (save-place-mode 1)
  ;; save minibuffer history
  (savehist-mode t)
  (recentf-mode t)
  ;; Visual bell
  (setq ring-bell-function 'ignore)
  ;; Place text over selected region
  (delete-selection-mode t)
  ;; Normal copy/paste/cut shortcuts
  (cua-mode t))

(use-package auto-dark
  :ensure t
  :config
  (setq auto-dark-dark-theme 'modus-vivendi-tinted)
  (setq auto-dark-light-theme 'leuven)
  (setq auto-dark-polling-interval-seconds 5)
  (setq auto-dark-allow-osascript t)
  (setq auto-dark-allow-powershell nil)
  (auto-dark-mode t))

;;; init.el --- personal emacs config -*- lexical-binding: t; -*-

;;; Code:

(load "~/.emacs.d/lisp/package-managers")
(load "~/.emacs.d/lisp/basic")
(load "~/.emacs.d/lisp/keybindings")
(load "~/.emacs.d/lisp/coding-fixing")
(load "~/.emacs.d/lisp/coding-completion")

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here

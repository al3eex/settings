;;; coding-fixing.el --- setup fixing (docs, formatting, linting) -*- lexical-binding: t; -*-

;;; Code:

(use-package json-mode)
(use-package kotlin-mode)
(use-package nasm-mode)
(use-package rust-mode)
(use-package typescript-mode)
(use-package vimrc-mode)
(use-package yaml-mode)
(use-package markdown-mode
  :magic "\\.md\\'")

(use-package eldoc
  :init
  (global-eldoc-mode))

(use-package format-all
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("C"     (astyle "--mode=c"))
                  ("C++"     (astyle "--mode=c"))
                  ("Shell" (shfmt "-i" "4" "-ci"))
                  ("Python" (ruff)))))

(use-package flymake
  :hook (prog-mode . flymake-mode)
  :bind (:map flymake-mode-map
              ("C-c ! n" . flymake-goto-next-error)
              ("C-c ! p" . flymake-goto-prev-error)
              ("C-c ! l" . flymake-show-buffer-diagnostics)))

(provide 'coding-fixing)
;;; coding-fixing.el ends here

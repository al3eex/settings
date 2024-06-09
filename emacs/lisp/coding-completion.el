;;; coding-completion.el --- setup completion (lsp, snippets) -*- lexical-binding: t; -*-

;;; Code:

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t)) ;; activate yasnippet
(use-package yasnippet-snippets
  :ensure t)

(straight-use-package
 '(lsp-bridge :host github
              :repo "manateelazycat/lsp-bridge"
              :files ("*.el" "*.py" "acm" "core" "langserver"
                      "multiserver" "resources")))

(unless (display-graphic-p)
  (straight-use-package
   '(popon :host nil :repo "https://codeberg.org/akib/emacs-popon.git"))
  (straight-use-package
   '(acm-terminal :host github :repo "twlz0ne/acm-terminal")))


(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)

;; enable signature help in posframe
(setq lsp-bridge-enable-signature-help t)
(setq lsp-bridge-signature-help-fetch-idle 0.3)
(setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
(setq lsp-bridge-signature-show-with-frame-position 'point)

;; combine lsp-bridge with orderless
(setq acm-candidate-match-function 'orderless-flex)
(setq acm-backend-lsp-candidate-min-length 1)

;; small QoL
(setq acm-enable-quick-access t)

;; language servers
(setq lsp-bridge-c-lsp-server "clangd")
(setq lsp-bridge-python-lsp-server "pylsp")
(global-lsp-bridge-mode)


(unless (display-graphic-p)
    (with-eval-after-load 'acm
    (require 'acm-terminal)))

(provide 'coding-completion)
;;; coding-completion.el ends here

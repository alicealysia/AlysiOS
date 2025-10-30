(use-package lsp-mode
  :ensure t)

;; For Without Tree Sitter
(use-package nix-mode
  :ensure t
  :hook
  (nix-mode . lsp-deferred)) ;; So that envrc mode will work

(use-package nix-mode
  :after lsp-mode
  :custom
  (lsp-disabled-clients '((nix-mode . nix-nil))) ;; Disable nil so that nixd will be used as lsp-server
  :config
  (setq lsp-nix-nixd-server-path "nixd"))

;; For Tree Sitter
(use-package nix-ts-mode
  :ensure t
  :mode "\\.nix\\'"
  :hook
  (nix-ts-mode . lsp-deferred)) ;; So that envrc mode will work

(use-package nix-ts-mode
  :after lsp-mode
  :custom
  (lsp-disabled-clients '((nix-ts-mode . nix-nil))) ;; Disable nil so that nixd will be used as lsp-server
  :config
  (setq lsp-nix-nixd-server-path "nixd"))

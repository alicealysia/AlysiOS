;;; init.el -- Visual Emacs, a visual template for your configuration. -*- lexical-binding: t; -*-
;;; Commentary:
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⢤⡰⡔⣕⢵⡹⣪⢣⢇⢧⢲⠤⡄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⠀⡠⡢⣳⢹⡱⣕⢝⢮⢺⢜⢎⢗⡝⣕⢗⢝⡺⡜⣎⢦⢠⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⣄⢧⡫⡺⣪⢣⡳⣕⢝⡎⡧⣫⢪⢃⢙⠜⠜⢕⠧⡫⡎⣞⢼⢸⡠⠀⠀⠀⠀⠀
;; ⠀⠀⠀⡠⣣⢳⡱⡝⡮⡪⣇⢗⡕⡧⣫⢺⢪⢣⠳⢑⠐⠀⠀⠀⠐⡝⣜⢎⢧⢫⡣⡂⠀⠀⠀
;; ⠀⠀⡰⡕⡧⡳⣕⢝⡎⣗⢕⢇⠏⡊⠊⠌⠠⠁⠠⠀⠄⡁⢌⢤⢱⡱⣕⢝⢎⢧⢳⡹⣐⠀⠀
;; ⠀⢌⢮⢳⡹⡜⣎⢧⢫⢎⠎⠀⠀⠄⠂⠐⢀⢂⢔⢔⢕⢎⢧⢳⢕⢽⢸⡱⡝⣎⢇⡗⣕⢅⠀
;; ⢨⢪⡳⡕⡧⡫⡮⣪⢳⡹⡀⢀⠀⠀⠀⢁⠳⡸⡪⣎⢗⡝⣎⢧⢫⢎⢧⢳⡹⡜⣎⢞⡜⡮⡀
;; ⡱⡕⡧⡫⣎⢗⡝⣜⢵⢕⢽⢔⡔⡔⣀⢀⠀⠀⠉⠪⡪⡺⡜⡎⡗⡝⣎⢧⢳⡱⡕⣇⢗⢵⡑
;; ⢧⡫⡎⣗⢕⢧⡫⡺⣜⢕⢗⢵⡹⣪⢺⢢⢇⢎⢄⠄⠈⠈⠪⢳⢹⡪⡺⡜⣎⢞⡜⡮⣪⡣⣣
;; ⢜⢮⢺⢪⡳⡕⣝⢮⢪⡳⡹⡪⠺⡘⠕⡉⠊⠨⠐⢈⠠⡢⢬⢪⢎⢮⡣⣫⡪⢮⢺⢜⢎⢮⢪
;; ⠪⡳⡹⣪⢺⢜⢮⡪⡇⠊⠀⠂⠁⡀⠂⠠⠨⡠⡱⡜⡮⣪⢳⡹⡪⣣⢫⡲⢭⢳⡱⡣⣏⢮⠣
;; ⠈⡗⣝⢎⢧⡫⢮⡪⡊⠀⠀⠀⠀⠀⠈⠘⠕⡝⡎⡧⣫⢪⡣⡳⣹⢸⡱⡹⡪⣣⢳⢹⡸⡜⡈
;; ⠀⠪⡺⡸⣕⢭⡣⡇⡂⡀⡀⡀⠀⠀⠀⠀⠀⠀⠈⠘⠨⠣⡫⡺⡜⣕⢝⢎⢧⢳⡹⡜⡎⠎⠀
;; ⠀⠀⠱⡹⡜⣎⢞⢼⡱⣕⢕⢮⢺⢜⣜⢬⢢⢅⢆⢔⢄⢄⠄⡡⠑⠱⡙⣎⢧⢳⡱⡣⡃⠁⠀
;; ⠀⠀⠀⠘⡪⡎⣗⠵⡕⣇⢯⡪⣇⢗⣕⢵⢝⢎⢗⠝⢜⢨⢂⢆⡕⣕⢕⢵⢱⡣⡓⠅⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠱⢱⢝⢮⢺⡸⡪⣎⢮⡪⣎⢮⢪⢲⡱⣣⢳⢭⢣⡫⡪⣎⢗⢕⠕⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⠀⠁⠳⢱⢝⡜⣎⢮⢺⡸⡪⣣⢳⡹⡸⡪⡎⣇⢏⠞⠜⠈⠀⠀⠀⠀⠀⠀⠀
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠊⠪⠪⢣⢳⢹⡸⡱⡕⡝⠪⠃⠃⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
;;; Code:

(package-initialize)
(org-babel-load-file (concat user-emacs-directory "README.org"))

;;; init.el ends here
;;--------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     default))
 '(ergoemacs-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key [f7] 'treemacs-projectile)
;;(setq-default cursor-type 'bar)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(delete-selection-mode 1)
(use-package catppuccin-theme)
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :config
  (which-key-mode))
(use-package nix-mode
  :after lsp-mode
  :ensure t
  :hook
  (nix-mode . lsp-deferred) ;; So that envrc mode will work
  :custom
  (lsp-disabled-clients '((nix-mode . nix-nil))) ;; Disable nil so that nixd will be used as lsp-server
  :config)
(defun indent-region-custom(numSpaces)
  (progn 
					; default to start and end of current line
    (setq regionStart (line-beginning-position))
    (setq regionEnd (line-end-position))
    
					; if there's a selection, use that instead of the current line
    (when (use-region-p)
      (setq regionStart (region-beginning))
      (setq regionEnd (region-end))
      )
    
    (save-excursion ; restore the position afterwards            
      (goto-char regionStart) ; go to the start of region
      (setq start (line-beginning-position)) ; save the start of the line
      (goto-char regionEnd) ; go to the end of region
      (setq end (line-end-position)) ; save the end of the line
      
      (indent-rigidly start end numSpaces) ; indent between start and end
      (setq deactivate-mark nil) ; restore the selected region
      )
    )
  )

(defun untab-region (N)
  (interactive "p")
  (indent-region-custom -2)
  )

(defun tab-region (N)
  (interactive "p")
  (if (active-minibuffer-window)
      (minibuffer-complete)    ; tab is pressed in minibuffer window -> do completion
					; else
    (if (string= (buffer-name) "*shell*")
        (comint-dynamic-complete) ; in a shell, use tab completion
					; else
      (if (use-region-p)    ; tab is pressed is any other buffer -> execute with space insertion
          (indent-region-custom 2) ; region was selected, call indent-region-custom
        (insert "    ") ; else insert four spaces as expected
	)))
  )

(global-set-key (kbd "<backtab>") 'untab-region)
(global-set-key (kbd "<tab>") 'tab-region)
(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)
(setq lsp-nix-nixd-server-path "nixd"
      ;;lsp-nix-nixd-formatting-command [ "nixfmt" ]
      lsp-nix-nixd-nixpkgs-expr "import <nixpkgs> { }"
      lsp-nix-nixd-nixos-options-expr "(builtins.getFlake \"/home/alice/alysios\").nixosConfigurations.nixos.options"
      lsp-nix-nixd-home-manager-options-expr "(builtins.getFlake \"/home/alice/alysios\").nixosConfigurations.nixos.options.home-manager.users.type.getSubOptions []")

(load-theme 'catppuccin :no-confirm)

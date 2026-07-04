(setq user-full-name "Eric Griffith"
      user-mail-address "griffith.eric@pm.me")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))
(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)
(setq org-directory "~/Projects/org/")

;; Start maximized
(add-hook 'window-setup-hook #'toggle-frame-maximized)

;; Never lose the cursor, shines when scrolling
(use-package! beacon)
(after! beacon (beacon-mode 1))

;; Keep buffers for visited files on disk up to date when modified by another program.
;; Also enable global auto revert for non-file buffers.
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Rainbow mode displays actual color for any hex value color.
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'org-agenda-mode)))
      (rainbow-mode 1))))
(global-rainbow-mode 1)

(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package grip-mode
  :ensure t
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode)))

(map! :leader
      :desc "Comment or uncomment lines"      "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
       :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines"          "t" #'toggle-truncate-lines
       :desc "Toggle vterm split"             "v" #'+vterm/toggle
       :desc "Toggle eshell split"            "e" #'+eshell/toggle))

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))

(require 'lsp-mode)

;; use gofumpt
(after! lsp-mode
  (setq lsp-go-use-gofumpt t))

;; auto organize imports
(add-hook 'go-mode-hook #'lsp-deferred)

;; make sure to not have other goimports hooks enabled
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection '("fish-lsp" "start"))
  :activation-fn (lsp-activate-on "fish")
  :server-id 'fish-lsp))

(add-to-list 'lsp-language-id-configuration '(fish-mode . "fish"))
(add-hook 'fish-mode-hook #'lsp)

(lsp-register-client
 (make-lsp-client
  :new-connection (lsp-stdio-connection '("just-lsp"))
  :activation-fn (lsp-activate-on "justfile" "Justfile")
  :server-id 'just-lsp))

(add-to-list 'lsp-language-id-configuration '(just-mode . "justfile"))
(add-to-list 'lsp-language-id-configuration '(just-mode . "Justfile"))
(add-hook #'just-mode-hook #'lsp)

(use-package! odin-ts-mode
  :mode "\\.odin\\'")

(after! treesit
  (add-to-list 'treesit-language-source-alist
               '(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")))

(add-hook 'odin-ts-mode-hook #'lsp-mode)
(setq lsp-odin-ols-binary-path "~/.local/share/ols/ols")

(use-package dotenv-mode
  :ensure t
  :mode ("\\.env\\'.*" . dotenv-mode))

(use-package dotenv
  :after projectile
  :hook
  (projectile-after-switch-project-hook . (lambda ()
                                            (dotenv-update-project-env (projectile-project-root)))))

(add-hook 'after-init-hook #'global-mise-mode)

(use-package aidermacs
  :bind (("C-c a" . 'aidermacs-transient-menu))
  :custom 
  (aidermacs-default-chat-mode 'architect)
  ;; (aidermacs-default-model "lm_studio/qwen/qwen3.6-27b")
  (aidermacs-default-model "anthropic/claude-sonnet-4-6")
  (aidermacs-exit-kills-buffer t))

(use-package ai-code
  :config
  ;; Set OpenCode as the default backend
  (ai-code-set-backend 'opencode)
  
  ;; Bind the main menu
  (global-set-key (kbd "C-c o") #'ai-code-menu)
  
  ;; Evil mode in AI window
  (with-eval-after-load 'evil (ai-code-backends-infra-evil-setup))
  
  ;; Enable auto-revert buffer so AI code change automatically appears in buffer
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Eric Griffith"
      user-mail-address "eric.griffith42@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;
;; Select settings below adapted from https://gitlab.com/dwt1/dotfiles
;;

;; Never lose the cursor, shines when scrolling
(beacon-mode 1)

;; Keep buffers for visited files on disk up to date when modified by another program.
;; Also enable global auto revert for non-file buffers.
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Display emojis. Can display Github style emojis like :smile: or plain ascii ones like :)
(use-package emojify
  :hook (after-init . global-emojify-mode))

;; Enable Github-flavored Markdown/Org preview
(use-package grip-mode
  :ensure t
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode)))

;; Line settings
(map! :leader
      :desc "Comment or uncomment lines"              "TAB TAB" #'comment-line
      (:prefix ("t" . "toggle")
               :desc "Toggle line numbers"            "l" #'doom/toggle-line-numbers
               :desc "Toggle line highlight in frame" "h" #'hl-line-mode
               :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
               :desc "Toggle truncate lines"          "t" #'toggle-truncate-lines))

;; Rainbow mode displays actual color for any hex value color.
(define-globalized-minor-mode global-rainbow-mode rainbow-mode
  (lambda ()
     (when (not (memq major-mode
                      (list 'org-agenda-mode)))
       (rainbow-mode 1))))
(global-rainbow-mode 1)

;; Various shell settings
(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))
(map! :leader
      :desc "Vterm toggle" "v t" #'+vterm/toggle
      :desc "Eshell"       "e s" #'+eshell/toggle)

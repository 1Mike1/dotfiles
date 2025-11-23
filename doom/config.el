;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;;(setq fancy-splash-image "~/.config/doom/banner/hacker.png")
;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mike"
      user-mail-address "mike@gmail.com")
(use-package! gcmh
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 256 1024 1024))  ; 256MB during idle
  :config
  (gcmh-mode 1))

(setq gc-cons-threshold 200000000) ; previous 33554432

;; credentials
(setq user-full-name "Michael Neuper"
      user-mail-address "michael@michaelneuper.com")

;; autosave and backup
(setq auto-save-default t
      make-backup-files t)

;; kill emacs without confiming
(setq confirm-kill-emacs nil)

;; remap <localleader> from SPC m to SPC l
(setq doom-localleader-key "SPC l"
      doom-localleader-alt-key "M-SPC l")

(use-package! which-key
  :init
  (setq which-key-idle-delay 0.5
        which-key-allow-multiple-replacements t)
  :config
  (which-key-mode 1)

  ;; modified from https://tecosaur.github.io/emacs-config/config.html#which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   '(("" . "\\`+?magit[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "\\1"))))

(if (featurep :system 'macos)
    (setq mac-command-modifier 'meta
          mac-option-modifier 'none
          mac-right-option-modifier 'super
          ns-use-proxy-icon nil ; disable file icon in titlebar
          ns-use-native-fullscreen t)

  (map! :nvi "M-v" #'yank))

(setq doom-theme 'doom-gruvbox
      doom-gruvbox-dark-variant "medium"
      doom-gruvbox-padded-modeline t)

(if (featurep :system 'macos)
    (progn
      (defconst my/serif-font "JetBrainsMono Nerd Font")
      (defconst my/sans-serif-font "JetBrainsMono Nerd Font")
      (defconst my/mono-font "JetBrainsMono Nerd Font"))
  (progn
    (defconst my/serif-font "JetBrainsMono Nerd Font")
    (defconst my/sans-serif-font "JetBrainsMono Nerd Font")
    (defconst my/mono-font "JetBrainsMono Nerd Font")))

(setq doom-font (font-spec :family my/mono-font :size 14)
      doom-variable-pitch-font (font-spec :family my/serif-font)
      doom-emoji-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14))

(after! nerd-icons
  (dolist (entry
           '(("s"     nerd-icons-sucicon "nf-seti-asm"         :face nerd-icons-blue)
             ("o"     nerd-icons-codicon "nf-cod-file_binary"  :face nerd-icons-orange)
             ("class" nerd-icons-codicon "nf-cod-file_binary"  :face nerd-icons-orange)
             ("vim"   nerd-icons-devicon "nf-dev-vim"          :face default)
             ("ms"    nerd-icons-mdicon  "nf-md-file_document" :face nerd-icons-silver)
             ("1"     nerd-icons-mdicon  "nf-md-file_document" :face nerd-icons-silver)
             ("ps"    nerd-icons-mdicon  "nf-md-vector_curve"  :face nerd-icons-dred)
             ("typ"   nerd-icons-flicon  "nf-linux-typst"      :face nerd-icons-dblue)))
    (add-to-list 'nerd-icons-extension-icon-alist entry)))

(custom-theme-set-faces! 'doom-gruvbox-dark-variant
  `(font-lock-escape-face :foreground ,(doom-color 'orange)))

(custom-set-faces!
  `(font-lock-doc-face
    :foreground ,(face-attribute 'font-lock-comment-face :foreground))
  `(hexl-address-region :font ,my/mono-font)
  `(hexl-ascii-region
    :background ,(doom-color 'bg-alt)
    :foreground ,(doom-color 'fg-alt)))

;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'visual)

(add-hook! 'display-line-numbers-mode-hook
  (custom-set-faces!
    '((line-number line-number-current-line)
      :slant normal)
    `(line-number-current-line
      :background ,(face-attribute 'line-number :background)
      :foreground ,(doom-color 'fg))))

(setq global-hl-line-modes '(prog-mode dired-mode))

;; Enable lsp-mode for Rust
(after! rust-mode
  (setq lsp-rust-server 'rust-analyzer) ; ensure rust-analyzer is used
  (add-hook 'rust-mode-hook #'lsp-deferred))

;; Optional: format on save using rustfmt
(setq +format-on-save-enabled-modes '(rust-mode))

(after! lsp-mode
  (setq lsp-rust-analyzer-server-display-inlay-hints t))

;; Set default frame size to 90% of the screen
(add-to-list 'initial-frame-alist
             `(width . ,(floor (* 0.9 (display-pixel-width)))))
(add-to-list 'initial-frame-alist
             `(height . ,(floor (* 0.9 (display-pixel-height)))))

;; Use system clipboard
(setq select-enable-clipboard t
      select-enable-primary t)

;; Save clipboard to kill-ring when killing text
(setq save-interprogram-paste-before-kill t)

;; Enable clipboard in terminal
(when (not (display-graphic-p))
  (setq x-select-enable-clipboard t))

(when (not (display-graphic-p))
  (setq select-enable-clipboard t))

;; Enable clipboard integration
(setq select-enable-clipboard t)

;; Map Ctrl+Shift+V to yank (paste)
(map! "C-S-v" #'yank)

;; Customized key bindings
;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;(setq doom-theme 'doom-gruvbox-dark)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type t)
;; add relative line display-line-numbers-type
;;(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; Set transparency
(defun my/set-transparency ()
  "Set the transparency of the current frame."
  (set-frame-parameter (selected-frame) 'alpha '(90 . 90)))

;; Apply to all new frames
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frames
              (my/set-transparency))))

;; Apply to the initial frame as well
(add-hook 'emacs-startup-hook 'my/set-transparency)

;; remove the title bar
(add-to-list 'default-frame-alist '(undecorated . t))

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

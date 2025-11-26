;;; config.el --- Doom Emacs configuration -*- lexical-binding: t; -*-

;; ============================================================================
;; SECTION: User Info
;; ============================================================================
(setq user-full-name "Mike"
      user-mail-address "mike@gmail.com")


;; ============================================================================
;; SECTION: Performance
;; ============================================================================

;; Smarter garbage collection
(use-package! gcmh
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 256 1024 1024))
  :config (gcmh-mode 1))

;; Startup GC threshold
(setq gc-cons-threshold (* 50 1000 1000))

;; Autosaving / backups
(setq auto-save-default t
      make-backup-files t)

;; Quit without asking
(setq confirm-kill-emacs nil)


;; ============================================================================
;; SECTION: Theme & Appearance
;; ============================================================================
(setq doom-theme 'doom-gruvbox
      doom-gruvbox-dark-variant "medium"
      doom-gruvbox-padded-modeline t)

(custom-theme-set-faces! 'doom-gruvbox-dark-variant
  `(font-lock-escape-face :foreground ,(doom-color 'orange)))


;; ============================================================================
;; SECTION: Fonts
;; ============================================================================

;; Use same font across systems (you can change later)
(defconst my/font "JetBrainsMono Nerd Font")

(setq doom-font (font-spec :family my/font :size 12)
      doom-variable-pitch-font (font-spec :family my/font)
      doom-emoji-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14))


;; ============================================================================
;; SECTION: Icons
;; ============================================================================
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


;; ============================================================================
;; SECTION: Line Numbers & Highlighting
;; ============================================================================
(setq display-line-numbers-type 'visual)

(add-hook! 'display-line-numbers-mode-hook
  (custom-set-faces!
    '((line-number line-number-current-line) :slant normal)
    `(line-number-current-line
      :background ,(face-attribute 'line-number :background)
      :foreground ,(doom-color 'fg))))

(setq global-hl-line-modes '(prog-mode dired-mode))


;; ============================================================================
;; SECTION: Which-key
;; ============================================================================
(use-package! which-key
  :init
  (setq which-key-idle-delay 0.5
        which-key-allow-multiple-replacements t)
  :config
  (which-key-mode 1)
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   '(("" . "\\`+?magit[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "\\1"))))


;; ============================================================================
;; SECTION: Keybindings
;; ============================================================================
(setq doom-localleader-key "SPC l"
      doom-localleader-alt-key "M-SPC l")

(map! "C-S-v" #'yank)

(map! :leader
      :desc "Open vterm"
      "o t" #'vterm)


;; ============================================================================
;; SECTION: OS-Specific (Mac)
;; ============================================================================
(when (featurep :system 'macos)
  (setq mac-command-modifier 'meta
        mac-option-modifier 'none
        mac-right-option-modifier 'super
        ns-use-proxy-icon nil
        ns-use-native-fullscreen t))


;; ============================================================================
;; SECTION: Clipboard
;; ============================================================================
(setq select-enable-clipboard t
      select-enable-primary t
      save-interprogram-paste-before-kill t)

(when (not (display-graphic-p))
  (setq x-select-enable-clipboard t))


;; ============================================================================
;; SECTION: Vterm
;; ============================================================================
(after! vterm
  ;; Copy mode
  (define-key vterm-mode-map (kbd "C-S-c") #'vterm-copy-mode)
  (add-hook 'vterm-copy-mode-hook
            (lambda ()
              (when vterm-copy-mode
                (message "Copy mode: select and press y")))))


;; ============================================================================
;; SECTION: Org Mode
;; ============================================================================
(setq org-directory "~/org/"
      org-agenda-files '("~/org/tasks.org"))


;; ============================================================================
;; SECTION: LSP General
;; ============================================================================
(setq lsp-enable-symbol-highlighting t
      lsp-headerline-breadcrumb-enable t
      lsp-lens-enable t
      lsp-log-io nil
      lsp-ui-doc-delay 0.2
      lsp-ui-doc-show-with-cursor t
      lsp-ui-doc-show-with-mouse t
      company-idle-delay 0.1)


;; ============================================================================
;; SECTION: Rust Development
;; ============================================================================
(after! rust-mode
  (add-hook 'rust-mode-hook #'lsp-deferred))

(after! rustic
  (setq rustic-format-on-save t
        lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-proc-macro-enable t))

(map! :leader
      :desc "Run cargo test"
      "m t" #'rustic-cargo-test)


;; ============================================================================
;; SECTION: Python Development
;; ============================================================================
(after! python
  (setq python-shell-interpreter "python3"))

(add-hook 'python-mode-hook #'lsp)
(add-hook 'python-mode-hook #'format-all-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'lsp-format-buffer nil t)))


;; ============================================================================
;; SECTION: Tree-sitter
;; ============================================================================
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Set default frame size to 90% of the screen
(add-to-list 'initial-frame-alist
             `(width . ,(floor (* 0.9 (display-pixel-width)))))
(add-to-list 'initial-frame-alist
             `(height . ,(floor (* 0.9 (display-pixel-height)))))

;; remove the title bar
(add-to-list 'default-frame-alist '(undecorated . t))

;;; End of config.el

;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; ------------------------------
;; Documentation / Knowledge Tools
;; ------------------------------
(package! tldr)
(package! mixed-pitch)
(package! valign)
(package! rainbow-mode)

;; Org & Writing Enhancements
(package! org-fragtog)
(package! ox-hugo)
(package! org-roam-bibtex)
(package! citar-org-roam)
(package! citar-embark)
(package! org-ref)
(package! ob-async)

;; Elfeed enhancements
(package! elfeed-tube)
(package! elfeed-goodies)

;; ------------------------------
;; Python Development
;; ------------------------------
(package! pyvenv)           ;; Virtualenv manager
(package! pipenv)           ;; Optional: pipenv support
(package! poetry)           ;; Optional: poetry support

(package! lsp-pyright)      ;; Best Python LSP server
(package! python-black)     ;; Formatting on save
(package! python-isort)     ;; Sort imports automatically

;; Debugging
(package! dap-mode)         ;; Debug Python w/debugpy
(package! realgud)          ;; Advanced debugging backend


;; ------------------------------
;; Rust Development
;; ------------------------------
(package! rust-mode)        ;; For rustic/lsp-mode
(package! cargo)            ;; Cargo integration
(package! toml-mode)
(package! flycheck-rust)    ;; Integrate rustc/clippy errors

;; Rust debugging (optional but recommended)
(package! dap-mode)         ;; Required for CodeLLDB
(package! lsp-mode)         ;; Ensures latest RA integration
(package! lsp-ui)           ;; Hover docs, lenses, etc.


;; ------------------------------
;; Tree-sitter Enhancements
;; ------------------------------
(package! tree-sitter)
(package! tree-sitter-langs)
;;(package! ts-fold)           ;; Better folding
(package! evil-tree-edit)    ;; Edit syntax tree

;; ------------------------------
;; Editing / Productivity
;; ------------------------------
(package! highlight-indent-guides)
(package! centaur-tabs)
(package! websocket)
(package! editorconfig)

;; ------------------------------
;; Optional AI Coding Helpers
;; ------------------------------
(package! gptel)              ;; Local AI / OpenAI / Llama interface

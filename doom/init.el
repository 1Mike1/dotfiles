;;; init.el -*- lexical-binding: t; -*-

(doom!

 ;; =========================
 ;; INPUT
 ;; =========================
 :input
 ;; + layout, japanese, chinese disabled

 ;; =========================
 ;; COMPLETION
 ;; =========================
 :completion
 (corfu +orderless +icons)   ; lightweight, fast, perfect for LSP
 helm                        ; alternative fuzzy UI
 vertico                     ; future-proof minibuffer system

 ;; =========================
 ;; UI
 ;; =========================
 :ui
 doom
 doom-dashboard
 doom-quit
 (emoji +unicode)
 hl-todo
 modeline
 nav-flash
 ophints
 (popup +defaults)
 smooth-scroll
 treemacs
 unicode
 (vc-gutter +pretty)
 vi-tilde-fringe
 workspaces

 ;; =========================
 ;; EDITOR
 ;; =========================
 :editor
 (evil +everywhere)
 file-templates
 fold
 lispy
 multiple-cursors
 snippets
 (whitespace +guess +trim)

 ;; =========================
 ;; EMACS CORE
 ;; =========================
 :emacs
 dired
 electric
 tramp
 undo
 vc

 ;; =========================
 ;; TERMINAL
 ;; =========================
 :term
 vterm

 ;; =========================
 ;; CHECKERS
 ;; =========================
 :checkers
 syntax
 (spell +flyspell)   ; spell-check markdown, org, docs

 ;; =========================
 ;; TOOLS
 ;; =========================
 :tools
 debugger
 docker
 (eval +overlay)
 lookup
 llm                   ; ChatGPT inside Emacs
 (lsp +eglot +peek)    ; gives you eglot or lsp-mode dynamically
 magit
 make
 (tree-sitter +lsp)    ; better parsing & highlighting

 ;; =========================
 ;; OS
 ;; =========================
 :os
 (:if (featurep :system 'macos) macos)

 ;; =========================
 ;; LANGUAGES
 ;; =========================
 :lang
 (cc +lsp)
 emacs-lisp
 (go +lsp)
 json
 (javascript +lsp +tree-sitter)
 markdown
 org
 python                ; enables python-mode + REPL
 (rust +lsp +tree-sitter)
 sh
 yaml

 ;; =========================
 ;; APPLICATIONS
 ;; =========================
 :app
 calendar

 ;; =========================
 ;; CONFIGURATION
 ;; =========================
 :config
 (default +bindings +smartparens))

;; Load your custom transparency settings
(load! "transparency.el")

;; Keep auto generated custom code out of this file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Don’t litter
(use-package no-littering
  :ensure t)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/"))))

;; Initialise package management
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; Theming
(when (display-graphic-p)
  (setq-default cursor-type 'bar)
  (scroll-bar-mode -1)
  (set-fringe-mode 10)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
)
(setq inhibit-startup-message t)
(setq visible-bell t)
(global-hl-line-mode t)


(use-package afternoon-theme :ensure t
  :config
  (load-theme 'afternoon t)
  (set-face-background hl-line-face "gray13"))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1)
  (setq doom-modeline-height 40))

(use-package rainbow-delimiters
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Org-mode
(defun org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (org-mode-visual-fill)
  (setq org-hide-emphasis-markers t))

(defun org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package org
  :ensure t
  :hook
  (org-mode . org-mode-setup))

(use-package org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-elipsis " ▾"
        org-hide-emphasis-markers t))

(set-face-attribute 'default nil :font "Monaspace Krypton" :height 120 :weight 'light)
(set-face-attribute 'org-default nil :font "Monaspace Radon")
(set-face-attribute 'org-block nil 
;; Projects (C-x p)
(use-package project :ensure t)
  
;; Treesitter
(setq treesit-language-source-alist
      '((css . ("https://github.com/tree-sitter/tree-sitter-css" "v0.20.0"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go" "v0.20.0"))
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "v0.20.1" "src")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(ruby "https://github.com/tree-sitter/tree-sitter-ruby")
	(yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "v0.5.0"))))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-ts-mode))

;; LSP
(use-package eglot
  :ensure t
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
		 `(ruby-ts-mode . ("ruby-lsp"))))
  :hook ((ruby-ts-mode . eglot-ensure)))


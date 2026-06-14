;;; init.el --- Emacs config generated from Neovim preferences -*- lexical-binding: t; -*-

;;; Package bootstrap
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Core editor behavior
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore
      visible-bell t
      make-backup-files nil
      auto-save-default nil
      create-lockfiles nil
      read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t
      confirm-kill-emacs 'y-or-n-p
      custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(defun my/project-grep ()
  "Search the current project, using ripgrep when it is available."
  (interactive)
  (if (executable-find "rg")
      (consult-ripgrep)
    (call-interactively #'project-find-regexp)))

(defun my/terminal ()
  "Open a terminal that works on both Unix-like systems and Windows."
  (interactive)
  (if (eq system-type 'windows-nt)
      (eshell)
    (eat)))

(defun my/duplicate-line-below ()
  "Duplicate the current line below, like the Neovim <leader>o binding."
  (interactive)
  (let ((line (buffer-substring (line-beginning-position) (line-end-position))))
    (end-of-line)
    (newline)
    (insert line)))

(defun my/duplicate-line-above ()
  "Duplicate the current line above, like the Neovim <leader>O binding."
  (interactive)
  (let ((line (buffer-substring (line-beginning-position) (line-end-position))))
    (beginning-of-line)
    (insert line)
    (newline)
    (forward-line -1)))

(setq-default indent-tabs-mode nil
              tab-width (if (getenv "motional") 4 2)
              fill-column 120
              truncate-lines nil)

(setq c-basic-offset (if (getenv "motional") 4 2)
      c-default-style "linux")

(setq-default js-indent-level (if (getenv "motional") 4 2)
              typescript-ts-mode-indent-offset (if (getenv "motional") 4 2)
              python-indent-offset (if (getenv "motional") 4 2))

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(column-number-mode 1)
(global-hl-line-mode -1)
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(save-place-mode 1)
(show-paren-mode 1)
(electric-pair-mode 1)
(winner-mode 1)

(setq-default show-trailing-whitespace t)
(setq whitespace-style '(face tabs tab-mark trailing space-before-tab newline-mark))
(setq whitespace-display-mappings
      '((tab-mark 9 [8594 32] [92 9])
        (newline-mark 10 [172 10])
        (space-mark 160 [9251] [95])))
(global-whitespace-mode 1)

(add-hook 'before-save-hook #'delete-trailing-whitespace)

;;; GUI defaults
(when (display-graphic-p)
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode 1)
  (set-fringe-mode 10)
  (setq frame-resize-pixelwise t
        use-dialog-box nil)
  (set-face-attribute 'default nil :height 120)
  (global-set-key (kbd "C-=") #'text-scale-increase)
  (global-set-key (kbd "C-+") #'text-scale-increase)
  (global-set-key (kbd "C--") #'text-scale-decrease)
  (global-set-key (kbd "C-0") (lambda () (interactive) (text-scale-set 0))))

;;; Vim editing and leader keys
(use-package evil
  :init
  (setq evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (evil-set-leader 'normal (kbd "SPC"))
  (evil-set-leader 'visual (kbd "SPC"))
  (evil-define-key 'insert 'global (kbd "C-a") #'move-beginning-of-line)
  (evil-define-key 'insert 'global (kbd "C-e") #'move-end-of-line)
  (evil-define-key 'insert 'global (kbd "C-k") #'kill-line)
  (evil-define-key 'insert 'global (kbd "C-d") #'delete-char)
  (evil-define-key 'insert 'global (kbd "C-c") #'evil-normal-state)
  (evil-define-key 'normal 'global (kbd "Y") #'evil-yank-line)
  (evil-define-key '(normal visual) 'global (kbd "<pagedown>") (kbd "C-d"))
  (evil-define-key '(normal visual) 'global (kbd "<pageup>") (kbd "C-u"))
  (evil-define-key '(normal visual) 'global (kbd "<home>") #'evil-first-non-blank)
  (evil-define-key '(normal visual) 'global (kbd "<end>") #'evil-end-of-line)
  (evil-define-key 'normal 'global (kbd "n") #'evil-ex-search-next)
  (evil-define-key 'normal 'global (kbd "N") #'evil-ex-search-previous))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :after evil
  :config
  (general-create-definer my/leader
    :states '(normal visual)
    :keymaps 'override
    :prefix "SPC")
  (my/leader
    ","  #'consult-buffer
    "/"  #'consult-line
    ":"  #'consult-complex-command
    "."  #'scratch-buffer
    "bb" #'compile
    "ca" #'eglot-code-actions
    "ff" #'project-find-file
    "fg" #'my/project-grep
    "fy" (lambda () (interactive) (kill-new (or buffer-file-name "")))
    "gb" #'magit-branch-checkout
    "gd" #'magit-diff-buffer-file
    "gl" #'magit-log-current
    "gs" #'magit-status
    "j"  #'flymake-goto-next-error
    "k"  #'flymake-goto-prev-error
    "mr" #'balance-windows
    "o"  #'my/duplicate-line-below
    "O"  #'my/duplicate-line-above
    "rn" #'eglot-rename
    "rr" #'xref-find-references
    "sd" #'consult-flymake
    "ss" #'consult-imenu
    "tt" #'my/terminal
    "ts" #'my/terminal
    "ub" #'modus-themes-toggle
    "vj" #'flymake-goto-next-error
    "vk" #'flymake-goto-prev-error
    "y"  #'clipboard-kill-ring-save)
  (general-def '(normal visual)
    "C-f" #'my/project-grep
    "C-p" #'project-find-file
    "C-b" #'compile
    "<f5>" #'compile
    "C-q" #'consult-flymake
    "C-h" #'tab-previous
    "C-l" #'tab-next
    "C-j" #'other-window
    "C-k" (lambda () (interactive) (other-window -1))
    "M-<left>" #'shrink-window-horizontally
    "M-<right>" #'enlarge-window-horizontally
    "M-<up>" #'enlarge-window
    "M-<down>" #'shrink-window
    "gd" #'xref-find-definitions
    "gD" #'xref-find-definitions-other-window
    "gr" #'xref-find-references
    "K" #'eldoc-doc-buffer
    "gj" #'flymake-goto-next-error
    "gk" #'flymake-goto-prev-error)
  (general-def '(normal visual insert emacs)
    "M-v" #'clipboard-yank
    "M-c" #'clipboard-kill-ring-save
    "C-S-v" #'clipboard-yank
    "C-S-c" #'clipboard-kill-ring-save))

;;; Completion, search, and pickers
(use-package vertico
  :init
  (vertico-mode 1))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode 1))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-s" . consult-line)
         ("M-y" . consult-yank-pop)))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)))

(use-package embark-consult
  :after (embark consult))

(use-package which-key
  :init
  (which-key-mode 1)
  :custom
  (which-key-idle-delay 0.4))

;;; Completion in buffers
(use-package corfu
  :init
  (global-corfu-mode 1)
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.1)
  :bind (:map corfu-map
              ("TAB" . corfu-next)
              ("S-TAB" . corfu-previous)
              ("C-n" . corfu-next)
              ("C-p" . corfu-previous)
              ("C-e" . corfu-quit)))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev))

(use-package yasnippet
  :init
  (yas-global-mode 1))

;;; Project, Git, files, and terminal
(use-package magit)

(use-package diff-hl
  :init
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1))

(use-package dired
  :ensure nil
  :config
  (require 'dired-x)
  (setq dired-listing-switches
        (if (eq system-type 'windows-nt)
            "-alh"
          "-alh --group-directories-first"))
  (put 'dired-find-alternate-file 'disabled nil)
  (evil-collection-define-key 'normal 'dired-mode-map
    (kbd "C-n") #'dired-jump
    (kbd "C-e") #'revert-buffer
    (kbd "C-y") #'dired-up-directory
    (kbd "g.") #'dired-omit-mode))

(use-package eat
  :if (not (eq system-type 'windows-nt))
  :commands eat)

;;; LSP, diagnostics, and language support
(use-package eglot
  :ensure nil
  :hook ((c-mode c++-mode c-ts-mode c++-ts-mode python-mode python-ts-mode lua-mode lua-ts-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((c-mode c++-mode c-ts-mode c++-ts-mode)
                 . ("clangd"
                    "--header-insertion=never"
                    "--j=4"
                    "--pch-storage=memory"
                    "--background-index"
                    "--suggest-missing-includes"
                    "--clang-tidy"
                    "--all-scopes-completion"
                    "--query-driver=/**/*")))
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("pylsp"))))

(use-package flymake
  :ensure nil
  :custom
  (flymake-show-diagnostics-at-end-of-line t))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode 1))

(use-package lua-mode)

;;; Theme and modeline
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 24)
  (doom-modeline-buffer-file-name-style 'truncate-with-project))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package helpful
  :bind (("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h k" . helpful-key)))

(provide 'init)
;;; init.el ends here

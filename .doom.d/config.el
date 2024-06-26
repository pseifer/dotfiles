;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Philipp Seifer"
      user-mail-address "philipp@seifer.me")

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

(setq doom-font "SauceCodePro Nerd Font-14")

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; Set the color theme and enbale bold and italics in (doom) themes.
;; See all available themes with `load-theme'.
(setq doom-theme 'doom-zenbones
      doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Display time in mode line.
(setq display-time-default-load-average nil)
(setq display-time-string-forms '((format-time-string "%a, %d.%m. %R " now)))
(setq doom-modeline-time-icon nil)
(display-time-mode)

;; Set splash screen image.
;; mx-butterfly based on https://commons.wikimedia.org/wiki/File:Mx-butterfly.svg
;; CC-BY Abraham Raji
;; https://creativecommons.org/licenses/by-sa/4.0/deed.en
(setq fancy-splash-image "~/.doom.d/mx-butterfly-splash.svg")

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
;; - `uSe-package!' for configuring packages
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

;; Fix a bug in lsp-mode.
(after! lsp-mode
  ;; https://github.com/emacs-lsp/lsp-mode/issues/3577#issuecomment-1709232622
  (delete 'lsp-terraform lsp-client-packages))

;; Custom keybindings: In insert and normal mode, navigate windows with Ctrl + HJKL.
(map!
 :ni "C-l" #'evil-window-right
 :ni "C-k" #'evil-window-up
 :ni "C-j" #'evil-window-down
 :ni "C-h" #'evil-window-left)

;; On return, delete highlights.
(map!
 :n "RET" #'evil-ex-nohighlight)

;; Fullscreen on startup.
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Remove window decorations (does not work?)
;; (set-frame-parameter nil 'undecorated t)

;; Save undo history.
(after! undo-tree
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-enable-undo-in-region nil)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))))

;; Start a server.
(server-start)

;; Set some default directories.
(setq projectile-project-search-path '("~/Projects/"))

;; Delete trailing spaces on save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Start org-mode with folded headings.
(after! org
  (setq org-agenda-files '("~/Notes/org" "~/Notes/org/notes"))
  (setq org-directory "~/Notes/org")
  (setq org-capture-templates
        '(("t" "Tasks" entry
           (file+headline "todo.org" "Inbox")
           "* TODO %?")
          ("d" "Deadline Task" entry
           (file+headline "todo.org" "Inbox")
           "* TODO %?\nDEADLINE: %^{DEADLINE}t ")
          ("a" "Linked Journal" entry
           (file+datetree "journal.org")
           "* %?\n%a")
          ;; TODO Capture calendar entries and tasks with deadline
          ("j" "Journal Entry" entry
           (file+datetree "journal.org")
           "* %?")))
  (setq org-startup-folded t))

;; Customize PDF-view.
;; (setq pdf-view-midnight-colors '("#f8f8f2" . "#282a36"))
;; (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)

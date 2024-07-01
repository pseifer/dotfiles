;;; doom-zenbones-theme.el --- based on Zenbones for Neovim -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: July 31, 2017 (#96)
;; Author: pseifer <https://github.com/pseifer>
;; Maintainer: Philipp Seifer <https://github.com/pseifer>
;; Source: https://github.com/zenbones-theme/zenbones.nvim
;;
;;; Commentary:
;;; Code:

; TODO: Reduce color usage.
(require 'doom-themes)


;;
;;; Variables

(defgroup doom-zenbones-theme nil
  "Options for the `doom-zenbones' theme."
  :group 'doom-themes)

(defcustom doom-zenbones-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-zenbones-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-zenbones
  "A light theme based on the Zenbones Neovim theme."

  ((bg         '("#F0EDEC" "white"   "white"))
   (fg         '("#2C363C" "#424242" "black"))

   ;; Alternative foreground and background colors.
   (bg-alt     '("#EBE7E6" "white"   "white"))
   (fg-alt     '("#3f4447" "#c7c7c7" "brightblack"))

   ;; Sorted intermediate colors between background and foreground.
   (base0 '("#525152" "white"       "white"))
   (base1 '("#655f5d" "brightblack" "brightblack"))
   (base2 '("#786D68" "brightblack" "brightblack"))
   (base3 '("#8E817B" "brightblack" "brightblack"))
   (base4 '("#BEB1AA" "brightblack" "brightblack"))
   (base5 '("#CDC2BC" "brightblack" "brightblack"))
   (base6 '("#D6CDC9" "brightblack" "brightblack"))
   (base7 '("#DDD6D3" "brightblack" "brightblack"))
   (base8 '("#E1DCDA" "black"       "black"))

   ;; More complete set of 'base' colors; reduced to the selected 9 above (+[fg|bg]alt).
   ;; #2C363C ; fg
   ;; #3f4447 ; fg-alt
   ;;
   ;; #525152
   ;; #655f5d
   ;; #786D68
   ;; #8E817B
   ;; #948985
   ;; #B2A39B
   ;; #BBABA3
   ;; #BEB1AA
   ;; #C4B6AF
   ;; #CDC2BC
   ;; #D6CDC9
   ;; #DDD6D3
   ;; #E1DCDA
   ;; #E9E4E2
   ;;
   ;; #EBE7E6 ; bg-alt
   ;; #F0EDEC ; bg

   ;; Colorful colors.
   (grey       '("#CFC1BA" "#e7e7e7" "brightblack"  ))
   (red        '("#A8334C" "#e45649" "red"          ))
   (orange     '("#94253E" "#dd8844" "brightred"    ))
   (green      '("#4F6C31" "#50a14f" "green"        ))
   (teal       '("#3F5A22" "#44b9b1" "brightgreen"  ))
   (yellow     '("#944927" "#986801" "yellow"       ))
   (blue       '("#1D5573" "#4078f2" "brightblue"   ))
   (dark-blue  '("#286486" "#a0bcf8" "blue"         ))
   (magenta    '("#88507D" "#a626a4" "magenta"      ))
   (violet     '("#7B3B70" "#b751b6" "brightmagenta"))
   (cyan       '("#2B747C" "#0184bc" "brightcyan"   ))
   (dark-cyan  '("#3B8992" "#005478" "cyan"         ))

   ;; Full base16 theme variant / Alacritty theme.
   ;;
   ;; [colors.bright]
   ;; black = "#CFC1BA"
   ;; red = "#94253E"
   ;; green = "#3F5A22"
   ;; yellow = "#803D1C"
   ;; blue = "#1D5573"
   ;; magenta = "#7B3B70"
   ;; cyan = "#2B747C"
   ;; white = "#4F5E68"
   ;;
   ;; [colors.cursor]
   ;; cursor = "#2C363C"
   ;; text = "#F0EDEC"
   ;;
   ;; [colors.normal]
   ;; black = "#F0EDEC"
   ;; blue = "#286486"
   ;; cyan = "#3B8992"
   ;; green = "#4F6C31"
   ;; magenta = "#88507D"
   ;; red = "#A8334C"
   ;; white = "#2C363C"
   ;; yellow = "#944927"
   ;;
   ;; [colors.primary]
   ;; background = "#F0EDEC"
   ;; foreground = "#2C363C"

   ;; Color assignments.
   (highlight                blue)
   (vertical-bar             (doom-darken base2 0.1))
   (selection                base7)
   (builtin                  magenta)
   (comments                 base4)
   (doc-comments             (doom-darken comments 0.15))
   (constants                violet)
   (functions                magenta)
   (keywords                 fg)
   (methods                  cyan)
   (operators                blue)
   (type                     yellow)
   (strings                  green)
   (variables                (doom-darken magenta 0.36))
   (numbers                  orange)
   (region                   `(,(doom-darken (car bg-alt) 0.1) ,@(doom-darken (cdr base0) 0.3)))
   (error                    red)
   (warning                  yellow)
   (success                  green)
   (vc-modified              orange)
   (vc-added                 green)
   (vc-deleted               red)
   (modeline-fg              fg)
   (modeline-fg-inactive     base6)
   (modeline-bg              base7)
   (modeline-bg-alt          base7)
   (modeline-bg-inactive     bg-alt)
   (modeline-bg-alt-inactive bg-alt)

   ;; Mode line padding.
   (-modeline-pad
      (when doom-zenbones-padded-modeline
        (if (integerp doom-zenbones-padded-modeline) doom-zenbones-padded-modeline 4))))

   ;; Face overrides.
   (((font-lock-doc-face &override) :slant 'italic)
    ((font-lock-comment-face &override) :slant 'italic)
    ((font-lock-string-face &override) :slant 'italic)
    ((font-lock-keyword-face &override) :weight 'bold)
    ((show-paren-match &override) :foreground fg :background base6)
    ((show-paren-mismatch &override) :foreground bg :background red)
    ((line-number-current-line &override) :foreground blue)
    (mode-line
     :background modeline-bg :foreground modeline-fg
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
    (mode-line-inactive
     :background modeline-bg-inactive :foreground modeline-fg-inactive
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
    (mode-line-emphasis :foreground highlight)
    (tooltip :background base7 :foreground fg)
    ;;(shadow :foreground base4)

    ;; nav-flash
    (nav-flash-face :background highlight :foreground bg)

    ;; centaur-tabs
    (centaur-tabs-unselected :background bg-alt :foreground base4)

    ;; css-mode <built-in> / scss-mode
    (css-proprietary-property :foreground orange)
    (css-property             :foreground green)
    (css-selector             :foreground blue)

    ;; doom-modeline
    (doom-modeline-bar :background highlight)

    ;; ediff <built-in>
    (ediff-current-diff-A        :foreground red   :background (doom-lighten red 0.8))
    (ediff-current-diff-B        :foreground green :background (doom-lighten green 0.8))
    (ediff-current-diff-C        :foreground blue  :background (doom-lighten blue 0.8))
    (ediff-current-diff-Ancestor :foreground teal  :background (doom-lighten teal 0.8))

    ;; helm
    (helm-candidate-number :background blue :foreground bg)

    ;; lsp-mode
    (lsp-ui-doc-background      :background base7)

    ;; magit
    (magit-blame-heading     :foreground orange :background bg-alt)
    (magit-diff-removed :foreground (doom-darken red 0.2) :background (doom-blend red bg 0.1))
    (magit-diff-removed-highlight :foreground red :background (doom-blend red bg 0.2) :bold bold)

    ;; markdown-mode
    (markdown-markup-face     :foreground base5)
    (markdown-header-face     :inherit 'bold :foreground red)
    ((markdown-code-face &override)       :background base1)
    (mmm-default-submode-face :background base1)

    ;; outline <built-in>
    ((outline-1 &override) :foreground red)
    ((outline-2 &override) :foreground orange)

    ;; org <built-in>
    ((org-block &override) :background base7)
    ;; ((org-block-begin-line &override) :foreground fg :slant 'italic)
    ;; (org-ellipsis :underline nil :background bg     :foreground red)
    ;; ((org-quote &override) :background base1)

    ;; ;; posframe
    ;; (ivy-posframe               :background base0)

    ;; selectrum
    (selectrum-current-candidate :background base2)

    ;; vertico
    (vertico-current :background selection)

    ;; solaire-mode
    (solaire-mode-line-face
     :inherit 'mode-line
     :background modeline-bg-alt
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
    (solaire-mode-line-inactive-face
     :inherit 'mode-line-inactive
     :background modeline-bg-alt-inactive
     :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt-inactive)))

    ;; web-mode
    (web-mode-current-element-highlight-face :background dark-blue :foreground bg)

    ;; wgrep <built-in>
    (wgrep-face :background base1)

    ;; whitespace
    ((whitespace-tab &override)         :background (if (not (default-value 'indent-tabs-mode)) base0 'unspecified))
    ((whitespace-indentation &override) :background (if (default-value 'indent-tabs-mode) base0 'unspecified)))

   ;; Variable overwrites.
   ())

;;; doom-zenbones-theme.el ends here

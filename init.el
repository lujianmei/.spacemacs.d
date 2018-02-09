;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ------------------------------------------------ace-isearch-input-length----------------
     (helm :variables
           ;; Use fuzzy match in helm
           helm-M-x-fuzzy-match t
           helm-buffers-fuzzy-matching t
           helm-recentf-fuzzy-match t
           ;; make helm can select anything even not match
           helm-move-to-line-cycle-in-source nil
           helm-ff-search-library-in-sexp t
           helm-ff-file-name-history-use-recentf t)
     auto-completion
     ;;spacemacs-ui-visual
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     (better-defaults :variables
                      better-defaults-move-to-end-of-code-first t
                      better-defaults-move-to-beginning-of-code-first t)
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)

     ;; ------------------------------ 
     ;; tools for daily using
     ;; ------------------------------ 
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     markdown
     (org :variables
          org-enable-github-support t
          org-enable-bootstrap-support t
          ;; org-enable-reveal-js-support t
          )
     ;; emoji
     ;; graphviz
     (latex :variables
            latex-build-command "LaTeX"
            latex-enable-auto-fill t
            latex-enable-folding t)
     (osx :variables
          osx-use-option-as-meta t
          osx-dictionary-dictionary-choice "Simplified Chinese - English")
     (plantuml :variables
               org-ditaa-jar-path "~/dotfiles-mac/.spacemacs.d/third-plugins/ditaa0_9.jar"
               ;; org-plantuml-jar-path "~/.spacemacs.d/third-plugins/plantuml.8031.jar"
               org-plantuml-jar-path "~/dotfiles-mac/.spacemacs.d/third-plugins/plantuml.1.2017.19.jar"

               ;; plantuml-jar-path "~/.spacemacs.d/third-plugins/plantuml.8031.jar"
               plantuml-jar-path "~/dotfiles-mac/.spacemacs.d/third-plugins/plantuml.1.2017.19.jar"
               )
     (mu4e :variables
           ;; change to built in mode
           mu4e-installation-path "~/.spacemacs.d/third-plugins/mu4e"
           ;; mu4e-enable-mode-line q
           mu4e-enable-notifications t)
     spell-checking
     syntax-checking
     ;; version-control
     (chinese :packages youdao-dictionary fcitx
              :variables chinese-enable-fcitx t 
              chinese-enable-youdao-dict t)



     ;; ------------------------------ 
     ;; language configuration
     ;; ------------------------------ 
     ansible
     ;; csv
     ;; nginx
     (imenu-list :variables
                 imenu-list-auto-resize nil
                 imenu-list-size 0.25)
    ;; vimscript
     yaml
     ;; (ruby :variables ruby-enable-enh-ruby-mode t)
     emacs-lisp
     html
     (javascript :variables
                 javascript-disable-tern-port-files nil
                 )
     ; lua
     ;; dash
     ;; tmux
     ;;haskell
     ;; sql
     ; java
     ;; parinfer
     (python :variables
             python-test-runner 'pytest
             python-enable-yapf-format-on-save t
             python-auto-set-local-pyenv-version 'on-visit)
     ; ipython-notebook
     ; (clojure :variables
              ; clojure-enable-fancify-symbols t)
     ; common-lisp
     (shell :variables
            shell-default-height 30
            shell-default-term-shell "/usr/local/bin/zsh"
            shell-default-position 'bottom)
     ; shell-scripts
     ; docker


     lujianmei
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(cnfonts org org-super-agenda org-alert)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style '(hybrid :variables
                                       hybrid-mode-enable-evilified-state t
                                       hybrid-mode-enable-hjkl-bindings nil
                                       hybrid-mode-default-state 'normal)

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '(;;(agenda . 3)
                                (recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         solarized-light
                         monokai
                         spacemacs-light
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Yahei Consolas Hybrid"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 500
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ; for master
  ; (setq configuration-layer--elpa-archives
        ; '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ; ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ; ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
;
  ;; for develop 
   (setq configuration-layer-elpa-archives
         '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
           ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
           ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
;

  ;; (setq debug-on-error t)
  (setq mu4e-mu-binary "/usr/local/bin/mu")


  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; add keybindings
  (defconst *is-a-mac* (eq system-type 'darwin))
  (when *is-a-mac*
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'control))
  ;;(setq default-input-method "MacOSX")

  ;; add my own configurations
  (push "/Users/kevin/.spacemacs.d/" load-path)

  ;; ******************************** start
  ;; (with-eval-after-load 'org)
  ;; here goes your Org config :)
    ;;(setq org-pomodoro-length)
    ;; start cnfonts with startup
    (cnfonts-enable)
    (setq cnfonts-use-face-font-rescale t)
    ;; (use-package org-alert
    ;;   :defer t
    ;;   :ensure t
    ;;   :init
    ;;   (progn
    ;;     (setq alert-default-style 'notifier)))



  (with-eval-after-load 'org
    ;; here goes your Org config :)

      ;; http://nadeausoftware.com/articles/2007/11/latency_friendly_customized_bullets_using_unicode_characters
    ;; (;;; Large
    ;;  "◉"
    ;;  "○"
    ;;  "✸"
    ;;  "✿"
    ;;  ;; ♥ ● ◇ ✚ ✜ ☯ ◆ ♠ ♣ ♦ ☢ ❀ ◆ ◖ ▶
    ;;   ;;; Small
    ;;  ;; ► • ★ ▸
    ;;  ) default=("◉" "○" "✸" "✿")
    (setq org-bullets-mode t)
    (setq org-bullets-bullet-list '("✤" "✥" "✣" "✢" "⌑" "◦"))
    ;; (setq org-bullets-bullet-list '("♜" "✥" "✣" "✢"))

       ;;================================================================
      ;; Config for TODO Configuration
      ;;================================================================
      ;; (setq org-todo-keywords
      ;;       (quote (;;(sequence "TODO(t)" "NEXT(n)" "MAYBE(m)" "STARTED(s)" "APPT(a)" "|" "DONE(d)")
      ;;               (sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
      ;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

      (setq org-todo-keywords
            (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "MAYBE(m)" "|" "DONE(d!/!)")
                    (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                    (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))))

      (setq org-todo-keyword-faces
            (quote (;;("NEXT" :inherit warning)
                    ("PROJECT" :inherit font-lock-string-face)
                    ("TODO" :foreground "red" :weight bold)
                    ("NEXT" :foreground "blue" :weight bold)
                    ("STARTED" :foreground "green" :weight bold)
                    ("DONE" :foreground "forest green" :weight bold)
                    ("WAITING" :foreground "orange" :weight bold)
                    ("MAYBE" :foreground "grey" :weight bold)
                    ("HOLD" :foreground "magenta" :weight bold)
                    ("CANCELLED" :foreground "forest green" :weight bold))))



      (setq org-use-fast-todo-selection t)
      (setq org-todo-state-tags-triggers
            (quote (("CANCELLED" ("CANCELLED" . t))
                    ("WAITING" ("WAITING" . t))
                    ("MAYBE" ("WAITING" . t))
                    ("HOLD" ("WAITING") ("HOLD" . t))
                    (done ("WAITING") ("HOLD"))
                    ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                    ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                    ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))



      (setq org-structure-template-alist
            '(("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
              ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
              ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
              ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE" "<verse>\n?\n</verse>")
              ("c" "#+BEGIN_COMMENT\n?\n#+END_COMMENT")
              ("p" "#+BEGIN_PRACTICE\n?\n#+END_PRACTICE")
              ("o" "#+begin_src emacs-lisp :tangle yes\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>")
              ("l" "#+begin_src emacs-lisp\n?\n#+end_src" "<src lang=\"emacs-lisp\">\n?\n</src>")
              ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
              ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
              ("H" "#+html: " "<literal style=\"html\">?</literal>")
              ("a" "#+begin_ascii\n?\n#+end_ascii")
              ("A" "#+ascii: ")
              ("i" "#+index: ?" "#+index: ?")
              ("I" "#+include %file ?" "<include file=%file markup=\"?\">")))

      ;; auto save files
      (run-at-time "00:59" 3600 'org-save-all-org-buffers)

      (custom-set-variables
       '(org-export-table-data-tags '("<tr class=\"CUSTOM_ID>" . "</t>")))

      ;; set export table's format
      (setq org-table-export-default-format "orgtbl-to-csv")

      
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      ;;(setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'init-org/org-insert-src-block)))


      ;; Resume clocking task when emacs is restarted
      (org-clock-persistence-insinuate)
      ;;
      ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
      (setq org-clock-history-length 23)
      ;; Resume clocking task on clock-in if the clock is open
      (setq org-clock-in-resume t)
      ;; Change tasks to NEXT when clocking in
      (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
      ;; Separate drawers for clocking and logs
      (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
      ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
      (setq org-clock-out-when-done t)
      ;; Save the running clock and all clock history when exiting Emacs, load it on startup
      (setq org-clock-persist t)
      ;; Do not prompt to resume an active clock
      (setq org-clock-persist-query-resume nil)
      ;; Enable auto clock resolution for finding open clocks
      (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
      ;; Include current clocking task in clock reports
      (setq org-clock-report-include-clocking-task t)

      (add-hook 'org-pomodoro-killed-hook 'bh/clock-in-organization-task-as-default)


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org publish
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; (require 'ox-publish)

      ;; update dynamic blocks when save file
      ;;(add-hook 'before-save-hook 'org-update-all-dblocks) commend because it is too slow in gtd.org

      ;;================================================================
      ;; Config for File Export HTML Format
      ;;================================================================ 

      ;; Increase default number of headings to export
      (setq org-export-headline-levels 6)
      ;; List of projects
      ;; Work-notes

      (setq org-publish-project-alist
            ;; (work notes for)
            (quote (("work-notes"
                     :base-directory "~/workspace/github/my-blog/work-notes/"
                     :publishing-directory "~/workspace/github/my-blog/publish-works"
                     :recursive t
                     :table-of-contents t
                     :base-extension "org"
                     :publishing-function org-html-publish-to-html
                     :style-include-default t
                     :section-numbers y
                     :table-of-contents y
                     :author-info y
                     :creator-info y)
                    ("work-notes-extra"
                     :base-directory "~/workspace/github/my-blog/work-notes/"
                     :publishing-directory "~/workspace/github/my-blog/publish-works"
                     :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
                     :publishing-function org-publish-attachment
                     :recursive t
                     :author nil)
                    ("worknotes"
                     :components ("work-notes" "work-notes-extra")))))



    )

  ;;================================================================
  ;; Config for Org Agenda
  ;;================================================================
  ;; config for org-mode
  ;;(setq org-default-notes-file (concat org-directory "/notes.org"))
  ;;(define-key global-map (kbd "M-<f6>") 'org-capture)
  (use-package org-super-agenda
    :defer t
    :ensure t)
  (with-eval-after-load 'org
    (org-super-agenda-mode)

    (let ((org-agenda-custom-commands
           '(("u" "Super view"
              (
               (agenda "" ((org-agenda-overriding-header "Groups Tasks")
                           (org-super-agenda-groups
                            '((:auto-group t
                                           :discard (:tag ("statistics")
                                                          :todo ("HOLD" "MAYBE")))))))
               ;; (todo "" ((org-agenda-overriding-header "Today's Tasks")
               ;;           (org-super-agenda-groups
               ;;            '(
               ;;              (:name "Important"
               ;;                     :todo "TODO"
               ;;                     :priority "A"
               ;;                     :time-grid t
               ;;                     :scheduled today)
               ;;              (:name "Other Tasks"
               ;;                     :todo "TODO"
               ;;                     :time-grid t
               ;;                     :priority< "A"
               ;;                     :scheduled today)
               ;;              (:name "Delay Tasks"
               ;;                     :todo "TODO"
               ;;                     :time-grid t
               ;;                     :deadline past)
               ;;              )
               ;;            )
               ;;           ))
               (todo "" ((org-agenda-overriding-header "Future Tasks")
                         (org-super-agenda-groups
                          '(
                            ;; Firstly show Today's work
                            ;;(:log t)  ; Automatically named "Log"
                            ;;(:name "Schedule"
                            ;;       :time-grid t)
                            (:name "Due soon"
                                   :deadline future)
                            ;;(:name "Unimportant"
                            ;;       :todo ("SOMEDAY" "MAYBE" "CHECK" "TO-READ" "TO-WATCH")
                            ;;       :order 100)
                            (:name "Waiting..."
                                   :todo ("WAITING" "MAYBE" "HOLD")
                                   :order 98))))))))))
      ;;(:name "Scheduled earlier"
      ;;       :scheduled past)
      
      (org-agenda nil "u")))



  
  (with-eval-after-load 'org-agenda
    
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "." 'spacemacs/org-agenda-transient-state/body)


    ;; Config Agenda View

    ;; Custom commands for the agenda -- start with a clean slate.
    (setq org-agenda-custom-commands nil)
    (setq org-agenda-inhibit-startup t) ;; ~50x speedup
    (setq org-agenda-span 'day)
    (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
    (setq org-agenda-window-setup 'current-window)
    (setq org-log-done t)

    ;; Do not dim blocked tasks
    (setq org-agenda-dim-blocked-tasks nil)


    ;;An entry without a cookie is treated just like priority ' B '.
    ;;So when create new task, they are default 重要且紧急
    ;; (setq org-agenda-custom-commands
    ;;       '(
    ;;         ("w" . "任务安排")
    ;;         ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
    ;;         ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
    ;;         ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
    ;;         ("b" "Blog" tags-todo "BLOG")
    ;;         ("p" . "项目安排")
    ;;         ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"Data-Center\"")
    ;;         ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"projects\"")
    ;;         ("W" "Weekly Review"
    ;;          ((stuck "") ;; review stuck projects as designated by org-stuck-projects
    ;;           (tags-todo "PROJECT"))))) ;; review all projects (assuming you use todo keywords to designate projects)

    )


  (with-eval-after-load 'org-download
    (setq org-download-screenshot-method "screencapture"))
  (setq spaceline-org-clock-p t)

  (with-eval-after-load 'org-pomodoro
    (progn
      (add-hook 'org-pomodoro-finished-hook '(lambda () (init-org/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
      (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (init-org/growl-notification "Short Break" "🐝 Ready to Go?" t)))
      (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (init-org/growl-notification "Long Break" " 💪 Ready to Go?" t)))
      ;; change org-pomodoro default 25 min to 30 min
      (setq org-pomodoro-length 30)
      )
    
    )

  ;; ;; (end org)
  ;; ;; ******************************** end


  ;; ******************************** start
  ;; (other configuration goes here)
  ;; ....

  ;; switch between insert state and normal state by quickly pressing the fd keys
  (setq-default evil-escape-key-sequence "jj")
  ;; (setq plantuml-jar-path "~/dotfiles-mac/.spacemacs.d/third-plugins/plantuml.1.2017.19.jar")
  ;; (spacemacs/toggle-truncate-lines-off)
  (setq projectile-enable-caching t)

  ;; config slime
  (setq inferior-lisp-program "/usr/local/bin/sbcl")

  ;; add system clipboard support  in macos
  (setq x-select-enable-clipboard t x-select-enable-primary t)


  (setq which-key-frame-max-width 40)
  ;; ******************************** end


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-table-data-tags (quote ("<tr class=\"CUSTOM_ID>" . "</t>")))
 '(package-selected-packages
   (quote
    (zenburn-theme yasnippet-snippets solarized-theme pippel overseer nameless monokai-theme importmagic epc ctable concurrent impatient-mode helm-mu org-alert cnfonts org-super-agenda youdao-dictionary names chinese-word-at-point yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit spaceline powerline smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode pcre2el pbcopy paradox ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl js2-refactor js-doc jinja2-mode insert-shebang indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flx-ido flx fish-mode fill-column-indicator fcitx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode request-deferred websocket request deferred js2-mode simple-httpd dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-emacs-eclim eclim company-auctex company-ansible company-anaconda company common-lisp-snippets column-enforce-mode coffee-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed auctex ansible-doc ansible anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-export-table-data-tags (quote ("<tr class=\"CUSTOM_ID>" . "</t>")))
 '(package-selected-packages
   (quote
    (org-alert cnfonts org-super-agenda youdao-dictionary names chinese-word-at-point yapfify yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit spaceline powerline smeargle slime-company slime slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode popwin plantuml-mode pip-requirements persp-mode pcre2el pbcopy paradox ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro org-plus-contrib org-mime org-download org-bullets open-junk-file neotree mwim multi-term mu4e-maildirs-extension mu4e-alert ht alert log4e gntp move-text mmm-mode markdown-toc markdown-mode magit-gitflow macrostep lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode launchctl js2-refactor js-doc jinja2-mode insert-shebang indent-guide imenu-list ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck flx-ido flx fish-mode fill-column-indicator fcitx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit ghub let-alist with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav ein skewer-mode request-deferred websocket request deferred js2-mode simple-httpd dumb-jump dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat diminish cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-emacs-eclim eclim company-auctex company-ansible company-anaconda company common-lisp-snippets column-enforce-mode coffee-mode clojure-snippets clj-refactor hydra inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider seq spinner queue pkg-info clojure-mode epl bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed auctex ansible-doc ansible anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

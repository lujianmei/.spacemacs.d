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
   '(rust
     react
     asciidoc
      pandoc
     ;; windows-scripts
     nginx
     sql
     command-log
     deft
     prodigy
     (ranger :variables
              ranger-show-preview t)
     clojure
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

     (gtags :variables gtags-enable-by-default t)
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
          org-enable-reveal-js-support t
          )
     ;; emoji
     graphviz
     (latex :variables
            latex-build-command "xelatex"
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
     ;; (mu4e :variables
     ;;       ;; change to built in mode
     ;;       mu4e-installation-path "~/.spacemacs.d/third-plugins/mu4e"
     ;;       ;; mu4e-enable-mode-line q
     ;;       mu4e-enable-notifications t)
     ;; spell-checking
     syntax-checking
     ;; version-control
     (chinese :variables chinese-enable-fcitx nil
              chinese-default-input-method 'wubi
              chinese-enable-avy-pinyin t
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
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-version-manager 'rvm
           ruby-test-runner 'rspec)
     ruby-on-rails
     emacs-lisp
     html
     (javascript :variables
                 javascript-disable-tern-port-files nil
                 tern-command '("node" " /usr/local/lib/node_modules/tern")
                 )
     lua
     dash
     ;; tmux
     haskell
     ;; sql
     ;; java
     ;; (go :variables go-use-gometalinter t
      (go :variables gofmt-command "goimports"
         go-tab-width 4)
     ;; parinfer
     (python :variables
             python-test-runner 'pytest
             python-enable-yapf-format-on-save t
             python-auto-set-local-pyenv-version 'on-visit)
     ipython-notebook

     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     ;; ...
     ;; (wakatime :variables
     ;;           wakatime-api-key  "0c4d964f-f6d6-4ca3-82d4-9dc09f5f6b36"
     ;;           use the actual wakatime path
     ;;           wakatime-cli-path "/usr/local/bin/wakatime")
;
     ;; (elfeed :variables
     ;;         elfeed-feeds '(("http://nullprogram.com/feed/" blog emacs)
     ;;                        "http://www.50ply.com/atom.xml"  ; no autotagging
     ;;                        ("http://nedroid.com/feed/" webcomic))
     ;;         elfeed-enable-web-interface t
     ;;         httpd-port 3333
     ;;         url-queue-timeout 30)

     (clojure :variables
              clojure-enable-fancify-symbols t)
     common-lisp
     (shell :variables
            shell-default-height 30
            shell-default-term-shell "/bin/zsh"
            shell-default-shell 'multi-term
            shell-default-full-span nil
            shell-enable-smart-eshell t
            shell-default-position 'bottom)
     ; shell-scripts
     docker

     ;; evil-cleverparens
     ;; vim-powerline
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; dotspacemacs-additional-packages '(cnfonts org org-super-agenda org-alert )
   dotspacemacs-additional-packages '(cnfonts)
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
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 3)
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
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
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
   dotspacemacs-active-transparency 70
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 40
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
   ; '(:relative nil
     ; :disabled-for-modes dired-mode
                         ; doc-view-mode
                         ; markdown-mode
                         ; org-mode
                         ; pdf-view-mode
                         ; text-mode
     ; :size-limit-kb 1000)
   ;; (default nil)
   ; dotspacemacs-line-numbers relative
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
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))

  ;; for develop 
   (setq configuration-layer-elpa-archives
         '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
           ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
           ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
;

  ;; (setq debug-on-error t)
  ;; (setq mu4e-mu-binary "/usr/local/bin/mu")


  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; set default for some setting for spacemacs
  (spacemacs/set-leader-keys-for-major-mode 'lisp-mode "," 'lisp-state-toggle-lisp-state)
  (setq-default dotspacemacs-persistent-server t)
  (setq-default dotspacemacs-smartparens-strict-mode t)

  ;; set LaTeX engine
  (setq TeX-engine (quote xetex))

  (setq projectile-enable-caching t)
  ;; add keybindings
  (defconst *is-a-mac* (eq system-type 'darwin))
  (when *is-a-mac*
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'control))
  ;;(setq default-input-method "MacOSX")

  ;; config for ranger
  (setq ranger-cleanup-on-disable t)
  (setq ranger-cleanup-eagerly t)

  ;; config for evil-cleverparens
  (add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
  (add-hook 'elisp-mode #'evil-cleverparens-mode)
  (add-hook 'lisp-mode #'evil-cleverparens-mode)

  ;; https://github.com/syl20bnr/spacemacs/issues/3225
;; Mac OS Edition for swich input method automatically
;; This code helps us to work with Spacemacs (Emacs + Evil mode) in multilanguage mode
;; You need to install https://github.com/vovkasm/input-source-switcher 
;; It's a console utilite to switch input language.
;; Pavel Pavlov (c) 2015
;; In other OS you'll have to change name of langages layers and name of Switcher like issw 
;; In thу Terminal # issw   show you namу of the current layout
  ;; when is a mac, using issw for the input-method command change method
  ;; (setq lang_source "com.apple.keylayout.US")                     ;set default var lang_source for issw arg
  ;; (add-hook 'evil-insert-state-entry-hook                         ;what we do when enter insert mode
  ;;           (lambda ()
  ;;             ;; (message (concat "insert-state-entry" lang_source))
  ;;             (shell-command (concat "issw " lang_source))))      ;
  ;;                                       ;
  ;; (add-hook 'evil-normal-state-entry-hook                         ;what we do when enter insert mode
  ;;           (lambda ()
  ;;             (setq lang_source (shell-command-to-string "issw"))
  ;;             ;; (message (concat "normal-state-entry" lang_source))
  ;;             (shell-command "issw com.apple.keylayout.US")
  ;;             (save-current-buffer)))      ;
  ;;                                       ;
  ;; (add-hook 'evil-insert-state-exit-hook                         ;what we do when enter insert mode
  ;;           (lambda ()
  ;;             ;; (message (concat "normal-state-exit " lang_source))
  ;;             (shell-command "issw com.sogou.inputmethod.sogouWB.wubi")))      ;

  ;; ;; (add-hook 'evil-normal-state-exit-hook                          ;what we do when enter normal mode

  ;; ;;           (lambda ()
  ;; ;;             (message (concat "normal-state-exit" lang_source))
  ;; ;;             ;; (setq lang_source (shell-command-to-string "issw"))
  ;; ;;             (shell-command (concat "issw " lang_source))))

  ;; (setq lang_source "com.apple.keylayout.US")                     ;set default var lang_source for issw arg
  ;; (add-hook 'evil-replace-state-entry-hook                         ;what we do when enter insert mode
  ;;           (lambda ()
  ;;             ;; (message (concat "replace-state-entry" lang_source))
  ;;             (shell-command (concat "issw " lang_source))))      ;
  ;;                                       ;
  ;; (add-hook 'evil-replace-state-exit-hook                          ;what we do when enter normal mode
  ;;           (lambda ()
  ;;             ;; (message (concat "replace-state-exit" lang_source))
  ;;             (setq lang_source (shell-command-to-string "issw"))
  ;;             (shell-command "issw com.apple.keylayout.US")))


        ;; add my own configurations
  ;; (push "/Users/kevin/.spacemacs.d/" load-path)
  ;; add def extension support configuration
  (setq deft-extensions '("org" "md"))
  ;; (setq deft-directory "~/workspace/github/work-notes")
  (with-eval-after-load 'org
    (setq org-confirm-babel-evaluate nil))

  (setq-default TeX-engine 'xelatex)
  (setq-default org-latex-compiler 'xelatex)
  ;; # # following is for export org-html, using https://github.com/fniessen/org-html-themes
  (with-eval-after-load 'org

    ;; add following in org file
    ;; #+OPTIONS:   H:4 num:t   toc:3 \n:nil @:t ::t |:t ^:nil -:t f:t *:t <:t p:t pri:t
    ;; #+OPTIONS:   TeX:t LaTeX:nil skip:nil d:nil todo:t pri:nil tags:not-in-toc
    ;; #+OPTIONS:   author:t creator:t timestamp:t email:t
    ;; #+DESCRIPTION: A notes that include all works and study things in 2017
    ;; #+KEYWORDS:  work note 2017
    ;; #+INFOJS_OPT: view:nil toc:t ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js
    ;; #+SETUPFILE: ~/.spacemacs.d/third-plugins/org-html-themes/setup/theme-readtheorg.setup
    ;; #+PROPERTY:  header-args :eval yes :eGxports both :results replace
    ;; # #+MACRO: longtext this is a very very long text to include
    ;; #+LATEX_CLASS: tongjithesis
    ;; #+LATEX_CLASS_OPTIONS: [adegree=doctor,pifootnote]
    ;; #+LATEX_HEADER: \usepackage{tongjiutils}
    ;; #+LATEX_HEADER: \usepackage[inline]{enumitem}
    ;; #+ATTR_LATEX: :environment itemize*
    ;; #+ATTR_LATEX: :options [label={}, itemjoin={,}, itemjoin*={, and}]
    ;; #+EXPORT_SELECT_TAGS: export
    ;; #+EXPORT_EXCLUDE_TAGS: noexport
    ;; #+STARTUP: logredeadline, logreschedule
    ;; #+ATTR_HTML: :border 2 :rules all :frame all



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


    )

    ;;;; configuration for export pdf, support chinese, using tongjithesis latex thesis template
  (with-eval-after-load 'org

    ;; following is a comman header for org file
    ;; #+LANGUAGE: zh
    ;; #+AUTHOR: Lu Jianmei
    ;; #+EMAIL: lu.jianmei@trs.com.cn
    ;; #+OPTIONS:   H:4 num:t   toc:3 \n:nil @:t ::t |:t ^:nil -:t f:t *:t <:t p:t pri:t
    ;; #+OPTIONS:   TeX:t LaTeX:nil skip:nil d:nil todo:t pri:nil tags:not-in-toc
    ;; #+OPTIONS:   author:t creator:t timestamp:t email:t
    ;; #+DESCRIPTION: A notes that include all works and study things in 2017
    ;; #+KEYWORDS:  work note 2017
    ;; #+INFOJS_OPT: view:nil toc:t ltoc:t mouse:underline buttons:0 path:http://orgmode.org/org-info.js
    ;; #+SETUPFILE: ~/.spacemacs.d/third-plugins/org-html-themes/setup/theme-readtheorg.setup
    ;; #+PROPERTY:  header-args :eval yes :eGxports both :results replace
    ;; # #+MACRO: longtext this is a very very long text to include
    ;; #+LATEX_CLASS: tongjithesis
    ;; #+LATEX_CLASS_OPTIONS: [adegree=doctor,pifootnote]
    ;; #+LATEX_HEADER: \usepackage{tongjiutils}
    ;; #+LATEX_HEADER: \usepackage[inline]{enumitem}
    ;; #+ATTR_LATEX: :environment itemize*
    ;; #+ATTR_LATEX: :options [label={}, itemjoin={,}, itemjoin*={, and}]
    ;; #+EXPORT_SELECT_TAGS: export
    ;; #+EXPORT_EXCLUDE_TAGS: noexport
    ;; #+STARTUP: logredeadline, logreschedule
    ;; #+ATTR_HTML: :border 2 :rules all :frame all


    (add-to-list 'org-latex-classes

                 '("tongjithesis"
                   "\\documentclass{tongjithesis}"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    (add-to-list 'org-latex-classes
                 '("metropolis"
                   "\\documentclass{beamer}"
                   ;; "\\usetheme{metropolis}"
                   ;; "\\usepackage{ctex}"
                   ))

    )

  (with-eval-after-load 'org
    (defvar org-agenda-dir "" "gtd org files location")
    (setq-default org-agenda-dir "~/workspace/github/work-notes/")
    (setq org-agenda-file-gtd (expand-file-name "work-notes.org" org-agenda-dir))
    (setq org-agenda-file-note (expand-file-name "work-notes.org" org-agenda-dir))
    (setq org-agenda-file-journal (expand-file-name "work-notes.org" org-agenda-dir))
    (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
    (setq org-default-notes-file (expand-file-name "work-notes.org" org-agenda-dir))
    (setq org-agenda-files (list org-agenda-dir))

    ;; the %i would copy the selected text into the template
  ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
  ;;add multi-file journal
  (setq org-capture-templates
        '(("1" "运营平台" entry (file+olp org-agenda-file-gtd "2019" "工作计划" "运营平台项目工作")
           "**** TODO [#A] %?\n"
           :empty-lines 1)
          ("2" "运维平台" entry (file+olp org-agenda-file-note "2019" "工作计划" "运维平台项目工作")
           "**** TODO [#A] %?\n"
           :empty-lines 1)
          ("3" "大数据ACP" entry (file+olp org-agenda-file-note "2019" "工作计划" "大数据ACP认证")
           "**** TODO [#A] %?\n"
           :empty-lines 1)
          ("4" "招聘工作" entry (file+olp org-agenda-file-note "2019" "工作计划" "招聘工作")
           "**** TODO [#B] %?\n"
           :empty-lines 1)
          ("5" "高中数学复习" entry (file+olp org-agenda-file-note "2019" "学习计划" "高中数学复习")
           "**** TODO [#B] %?\n"
           :empty-lines 1)
          ("6" "数学建模" entry (file+olp org-agenda-file-note "2019" "学习计划" "数学建模")
           "**** TODO [#B] %?\n"
           :empty-lines 1)
          ("7" "算法与数据结构" entry (file+olp org-agenda-file-note "2019" "学习计划" "算法与数据结构学习")
           "**** TODO [#B] %?\n"
           :empty-lines 1)
          ("8" "厦门大学金融课" entry (file+olp org-agenda-file-note "2019" "学习计划" "厦门大学金融课")
           "**** TODO [#B] %?\n"
           :empty-lines 1)
          ("9" "日常任务" entry (file+olp org-agenda-file-note "2019" "日常任务")
           "**** TODO [#C] %?\n"
           :empty-lines 1)
          ("a" "其它学习任务" entry (file+olp org-agenda-file-note "2019" "学习计划" "其它学习任务")
           "**** TODO [#B] %?\n"
           :empty-lines 1)

          ("i" "Code Snippet" entry
           (file org-agenda-file-code-snippet)
           "** %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
          ("c" "Chrome" entry (file+olp org-agenda-file-note "2019" "Captures")
           "*** TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
           :empty-lines 1)
          ("l" "links" entry (file+headline org-agenda-file-note "Captures")
           "*** TODO [#C] %?\n  %i\n %a \n %U"
           :empty-lines 1)
          ("j" "2019年日记"
           entry (file+datetree org-agenda-file-journal "日记")
           "* %?"
           :empty-lines 1)
          ))

  ;;An entry without a cookie is treated just like priority ' B '.
  ;;So when create new task, they are default 重要且紧急
  (setq org-agenda-custom-commands
        '(
          ("w" . "任务安排")
          ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
          ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
          ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
          ;; ("b" "Blog" tags-todo "BLOG")
          ("p" . "项目安排")
          ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"operation-work-task\"")
          ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"manage-work-task\"")
          ("W" "Weekly Review"
           ((stuck "") ;; review stuck projects as designated by org-stuck-projects
            (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
            ))))

    )

  (with-eval-after-load 'org-agenda
    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "." 'spacemacs/org-agenda-transient-state/body)
    )

  ;; configuration for export beamer, support beamer pdf export using Metropolis theme (https://github.com/matze/mtheme), support Reveal.js https://github.com/hakimel/reveal.js
  (with-eval-after-load 'org

    ;; # # following is setting for reveal, https://github.com/yjwen/org-reveal/
    ;; #+REVEAL_ROOT: http://cdn.jsdelivr.net/reveal.js/3.0.0/
    ;; #+REVEAL_THEME: solarized
    ;; # # you can choose from serif, moon, black, beige, blood, league, night, simple, sky, solarized, white
    ;; #+REVEAL_TRANS: default
    ;; # # You can choose from none, fade, slide, convex, concave and zoom
    ;; #+REVEAL_HLEVEL: 1
    ;; #+OPTIONS: reveal_slide_number:h/v reveal_global_header:t reveal_global_footer:t
    ;; #+OPTIONS: reveal_control reveal_progress reveal_rolling_links  org-reveal-plugins reveal_single_file:nil
    ;; #+REVEAL_PLUGINS: (highlight) 
    ;; #+ATTR_REVEAL: :frag frag-style
    ;; # #+ATTR_REVEAL: :frag t # # will use Reveal.js default fragment style
    ;; # following supports multiplexing, which allows allows your audience to view the slides of the presentation you are controlling on their own phone, tablet or laptop
    ;; # #+REVEAL_MULTIPLEX_ID: [Obtained from the socket.io server. ]
    ;; # #+REVEAL_MULTIPLEX_SECRET: [Obtained from socket.io server. Gives the master control of the presentation.]
    ;; # #+REVEAL_MULTIPLEX_URL: http://revealjs.jit.su:80 [Location of socket.io server]
    ;; # #+REVEAL_MULTIPLEX_SOCKETIO_URL: http://cdnjs.cloudflare.com/ajax/libs/socket.io/0.9.10/socket.io.min.js
    ;; # #+REVEAL_PLUGINS: ([any other plugins you are using] multiplex)

    ;; # # following is setting for beamer, https://github.com/fangohr/template-beamer-metropolis-from-orgmode
    ;; #+OPTIONS:   H:2 num:t toc:t \n:nil ::t |:t ^:t -:t f:t *:t tex:t d:(HIDE) tags:not-in-toc <:t
    ;; #+OPTIONS:   d:nil todo:t pri:nil
    ;; #+STARTUP: beamer
    ;; #+LATEX_HEADER: \usetheme{metropolis}
    ;; #+LATEX_HEADER: \metroset{block=fill}
    ;; #+LATEX_HEADER: \usepackage{ctex}
    ;; #+BEAMER_FRAME_LEVEL: 2
    ;; #+LATEX_HEADER: \setbeamertemplate{frame footer}{\color{lightgray}Lujianmei - Orgmode + Beamer}
    ;; #+STARTUP: beamer
    ;; #+ATTR_BEAMER: :overlay +-
    ;; #+LATEX_COMPILER: xelatex
    ;; #+COLUMNS: %40ITEM %10BEAMER_env(Env) %9BEAMER_envargs(Env Args) %4BEAMER_col(Col) %10BEAMER_extra(Extra)

    ;; Make the code blocks look nicer
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    (setq org-latex-listings 'minted)

    ;; style decision for source code blocks
    (setq org-latex-minted-options
          '(("bgcolor" "white") ("frame" "lines")))


    ;; the next section allows to add :ignoreheading: to section headers,
    ;; and the heading will be removed in the latex output, but the section
    ;; itself be included.
    ;;
    ;; This is useful to 'label' paragraphs or sections to draft a document
    ;; while not wanting to reveal that label/title in the final version to the
    ;; reader.
    (defun sa-ignore-headline (contents backend info)
      "Ignore headlines with tag `ignoreheading'."
      ;;(message "*** debug: working on ignoreheading")
      (when (and (org-export-derived-backend-p backend 'latex 'html 'ascii)
                 (string-match "\\(\\`.*\\)ignoreheading\\(.*\n\\)"
                               (downcase contents)))
                                        ;(replace-match "\\1\\2" nil nil contents)  ;; remove only the tag ":ignoreheading:" but keep the rest of the headline
        (replace-match "" nil nil contents)        ;; remove entire headline
        (message "*** replacing header")
        ))
    (add-to-list 'org-export-filter-headline-functions 'sa-ignore-headline)
    ;; Note: This ^doesn't seem to work at the moment; needs fixing. Dec 2016

    ;; Use utf8x for LaTeX export to access more unicode characters
    (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
    )

  ;;  it is possible to merge the svg xml with html file
  (with-eval-after-load 'org
    (defun org-babel-result-to-file (result &optional description)
      "If result file is svg type, convert RESULT into html file and
plugin the html text in the exported file."
      (when (stringp result)
        (if (string= "svg" (file-name-extension result))
            (progn
              (with-temp-buffer
                (if (file-exists-p (concat result ".html"))
                    (delete-file (concat result ".html")))
                (rename-file result (concat result ".html"))
                (insert-file-contents (concat result ".html"))
                (message (concat result ".html"))
                (format "#+BEGIN_HTML
<div style=\"text-align: center;\">
%s
</div>
#+END_HTML"
                        (buffer-string)
                        )))
          (progn
            (format "[[file:%s]%s]"
                    (if (and default-directory
                             buffer-file-name
                             (not (string= (expand-file-name default-directory)
                                           (expand-file-name
                                            (file-name-directory buffer-file-name)))))
                        (expand-file-name result default-directory)
                      result)
                    (if description (concat "[" description "]") ""))))))


    )
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
    "ib" 'init-org/org-insert-src-block)

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

    ;; add GOPATH env
;;     (when (memq window-system '(mac ns))
;;       (exec-path-from-shell-initialize)
;;       (exec-path-from-shell-copy-env "PATH"))
;; ;; example of setting env var named “path”, by appending a new path to existing path
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/usr/local/textlive/2018/bin/x86_64-darwin/"))
;; (setq exec-path (append exec-path '("/usr/local/bin:/usr/local/textlive/2018/bin/x86_64-darwin/")))

;; default options for all output formats
(setq org-pandoc-options '((standalone . t)))
;; cancel above settings only for 'docx' format
(setq org-pandoc-options-for-docx '((standalone . nil)))
;; special settings for beamer-pdf and latex-pdf exporters
(setq org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex")))
(setq org-pandoc-options-for-latex-pdf '((pdf-engine . "xelatex")))
;; (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
;; special extensions for markdown_github output
(setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))


;; For paredit

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook          (lambda () (paredit-mode +1)))
(add-hook 'slime-mode-hook            (lambda () (smartparens-mode +1)))


  ;; ******************************** start
  ;; (other configuration goes here)
  ;; ....

  ;; switch between insert state and normal state by quickly pressing the fd keys
  (setq-default evil-escape-key-sequence "jj")
  ;; (setq plantuml-jar-path "~/dotfiles-mac/.spacemacs.d/third-plugins/plantuml.1.2017.19.jar")
  ;; (spacemacs/toggle-truncate-lines-off)
  ;; (setq projectile-enable-caching t)

  ;; config slime
  (setq inferior-lisp-program "/usr/local/bin/sbcl")

  ;; add system clipboard support  in macos
  (setq x-select-enable-clipboard t x-select-enable-primary t)


  (setq which-key-frame-max-width 40)
  ;; ******************************** end

  ;; enable cache

  (setq org-pomodoro-length 45)

  (global-set-key (kbd "S-<SPC>") 'toggle-input-method)
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
 '(org-agenda-files
   (quote
    ("~/workspace/github/work-notes/notes/work-related-documents/shufeng/service-market-project.org" "/Users/kevin/workspace/github/work-notes/index.org" "/Users/kevin/workspace/github/work-notes/mobileorg.org" "/Users/kevin/workspace/github/work-notes/snippet.org" "/Users/kevin/workspace/github/work-notes/work-note-in-2015.org" "/Users/kevin/workspace/github/work-notes/work-note-in-2016.org" "/Users/kevin/workspace/github/work-notes/work-note-in-2017.org" "/Users/kevin/workspace/github/work-notes/work-note-in-2018.org" "/Users/kevin/workspace/github/work-notes/work-notes.org")))
 '(org-export-table-data-tags (quote ("<tr class=\"CUSTOM_ID>" . "</t>")))
 '(package-selected-packages
   (quote
    (toml-mode racer flycheck-rust counsel-gtags cargo rust-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv ranger projectile-rails rake prodigy ox-reveal minitest lua-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-pos-tip pos-tip flycheck-haskell flycheck feature-mode evil-snipe enh-ruby-mode ein polymode deferred websocket deft company-ghci company-ghc ghc haskell-mode company-cabal command-log-mode cmm-mode chruby bundler inf-ruby org-super-agenda org-projectile org-pomodoro org-alert alert magit-gitflow livid-mode evil-magit zeal-at-point yapfify yaml-mode xterm-color web-mode web-beautify unfill tagedit sql-indent smeargle slime-company slime slim-mode skewer-mode shell-pop scss-mode sass-mode reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pug-mode plantuml-mode pip-requirements pbcopy pandoc-mode ox-twbs ox-pandoc ox-gfm osx-trash osx-dictionary orgit magit git-commit ghub async ht org-category-capture org-present log4e org-mime org-download gntp nginx-mode mwim multi-term mmm-mode markdown-toc markdown-mode treepy graphql simple-httpd live-py-mode launchctl js2-refactor js2-mode js-doc jinja2-mode imenu-list ibuffer-projectile hy-mode htmlize helm-pydoc helm-gtags helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link with-editor gh-md ggtags fuzzy dash eshell-z eshell-prompt-extras esh-help emmet-mode dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-auctex company-ansible company-anaconda company common-lisp-snippets coffee-mode cnfonts clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider sesman queue clojure-mode auto-yasnippet yasnippet auctex ansible-doc ansible anaconda-mode pythonic adoc-mode markup-faces ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
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
 '(package-selected-packages
   (quote
    (rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv ranger projectile-rails rake prodigy ox-reveal minitest lua-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-pos-tip pos-tip flycheck-haskell flycheck feature-mode evil-snipe enh-ruby-mode ein polymode deferred websocket deft company-ghci company-ghc ghc haskell-mode company-cabal command-log-mode cmm-mode chruby bundler inf-ruby org-super-agenda org-projectile org-pomodoro org-alert alert magit-gitflow livid-mode evil-magit zeal-at-point yapfify yaml-mode xterm-color web-mode web-beautify unfill tagedit sql-indent smeargle slime-company slime slim-mode skewer-mode shell-pop scss-mode sass-mode reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pug-mode plantuml-mode pip-requirements pbcopy pandoc-mode ox-twbs ox-pandoc ox-gfm osx-trash osx-dictionary orgit magit git-commit ghub async ht org-category-capture org-present log4e org-mime org-download gntp nginx-mode mwim multi-term mmm-mode markdown-toc markdown-mode treepy graphql simple-httpd live-py-mode launchctl js2-refactor js2-mode js-doc jinja2-mode imenu-list ibuffer-projectile hy-mode htmlize helm-pydoc helm-gtags helm-gitignore helm-dash helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link with-editor gh-md ggtags fuzzy dash eshell-z eshell-prompt-extras esh-help emmet-mode dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-auctex company-ansible company-anaconda company common-lisp-snippets coffee-mode cnfonts clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider sesman queue clojure-mode auto-yasnippet yasnippet auctex ansible-doc ansible anaconda-mode pythonic adoc-mode markup-faces ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

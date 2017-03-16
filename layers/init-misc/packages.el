;;; packages.el --- lujianmei Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 lujianmei
;;
;; Author: lujianmei
;; URL: https://github.com/lujianmei/.spacemacs.d.git
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(setq init-misc-packages
      '(
        fcitx
        peep-dired
        (highlight-global :location (recipe :fetcher github :repo "glen-dai/highlight-global"))
        multiple-cursors
        ace-isearch
        tabbar
        ))

(defun init-misc/init-tabbar()
  (use-package tabbar
    :defer t
    :ensure t
    :config
    (progn

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      (defun tabbar-select-end-tab ()
        "Select end tab of current tabset."
        (interactive)
        (tabbar-select-beg-tab t))

      (defun tabbar-select-beg-tab (&optional backward type)
        "Select beginning tab of current tabs.
If BACKWARD is non-nil, move backward, otherwise move forward.
TYPE is default option."
        (interactive)
        (let* ((tabset (tabbar-current-tabset t))
               (ttabset (tabbar-get-tabsets-tabset))
               (cycle (if (and (eq tabbar-cycle-scope 'groups)
                               (not (cdr (tabbar-tabs ttabset))))
                          'tabs
                        tabbar-cycle-scope))
               selected tab)
          (when tabset
            (setq selected (tabbar-selected-tab tabset))
            (setq tabset (tabbar-tabs tabset)
                  tab (car (if backward (last tabset) tabset)))
            (tabbar-click-on-tab tab type))))

      (defun tabbar-backward-tab-other-window (&optional reversed)
        "Move to left tab in other window.
Optional argument REVERSED default is move backward, if reversed is non-nil move forward."
        (interactive)
        (other-window 1)
        (if reversed
            (tabbar-forward-tab)
          (tabbar-backward-tab))
        (other-window -1))

      (defun tabbar-forward-tab-other-window ()
        "Move to right tab in other window."
        (interactive)
        (tabbar-backward-tab-other-window t))



;;; Code:

      (defcustom tabbar-hide-header-button t
        "Hide header button at left-up corner.
Default is t."
        :type 'boolean
        :set (lambda (symbol value)
               (set symbol value)
               (if value
                   (setq
                    tabbar-scroll-left-help-function nil ;don't show help information
                    tabbar-scroll-right-help-function nil
                    tabbar-help-on-tab-function nil
                    tabbar-home-help-function nil
                    tabbar-buffer-home-button (quote (("") "")) ;don't show tabbar button
                    tabbar-scroll-left-button (quote (("") ""))
                    tabbar-scroll-right-button (quote (("") "")))))
        :group 'tabbar)

      (defun tabbar-filter (condp lst)
        (delq nil
              (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

      (defun tabbar-filter-buffer-list ()
        (tabbar-filter
         (lambda (x)
           (let ((name (format "%s" x)))
             (and
              (not (string-prefix-p "*epc" name))
              (not (string-prefix-p "*helm" name))
              (not (string-prefix-p "*Messages*" name))
              )))
         (delq nil
               (mapcar #'(lambda (b)
                           (cond
                            ;; Always include the current buffer.
                            ((eq (current-buffer) b) b)
                            ((buffer-file-name b) b)
                            ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                            ((buffer-live-p b) b)))
                       (buffer-list)))))

      (setq tabbar-buffer-list-function 'tabbar-filter-buffer-list)



      (defvar tabbar-ruler-projectile-tabbar-buffer-group-calc nil
        "Buffer group for projectile.  Should be buffer local and speed up calculation of buffer groups.")
      (defun tabbar-ruler-projectile-tabbar-buffer-groups ()
        "Return the list of group names BUFFER belongs to.
    Return only one group for each buffer."
        
        (if tabbar-ruler-projectile-tabbar-buffer-group-calc
            (symbol-value 'tabbar-ruler-projectile-tabbar-buffer-group-calc)
          (set (make-local-variable 'tabbar-ruler-projectile-tabbar-buffer-group-calc)
               
               (cond
                ((or (get-buffer-process (current-buffer)) (memq major-mode '(comint-mode compilation-mode))) '("Term"))
                ((string-equal "*" (substring (buffer-name) 0 1)) '("Misc"))
                ((condition-case err
                     (projectile-project-root)
                   (error nil)) (list (projectile-project-name)))
                ((memq major-mode '(emacs-lisp-mode python-mode emacs-lisp-mode c-mode c++-mode makefile-mode lua-mode vala-mode)) '("Coding"))
                ((memq major-mode '(javascript-mode js-mode nxhtml-mode html-mode css-mode)) '("HTML"))
                ((memq major-mode '(org-mode calendar-mode diary-mode)) '("Org"))
                ((memq major-mode '(dired-mode)) '("Dir"))
                (t '("Main"))))
          (symbol-value 'tabbar-ruler-projectile-tabbar-buffer-group-calc)))

      (defun tabbar-ruler-group-by-projectile-project()
        "Group by projectile project."
        (interactive)
        (setq tabbar-buffer-groups-function 'tabbar-ruler-projectile-tabbar-buffer-groups))

      ;; group by projectile
      (tabbar-ruler-group-by-projectile-project)
      (tabbar-mode)


      )
    )
  )

;;(require 's)
(defun init-misc/init-highlight-global ()
  (use-package highlight-global
    :ensure t
    :init
    (progn
      (spacemacs/set-leader-keys "hh" 'highlight-frame-toggle)
      (spacemacs/set-leader-keys "hc" 'clear-highlight-frame)
      (setq-default highlight-faces
                    '(('hi-red-b . 0)
                      ('hi-yellow . 0)
                      ('hi-pink . 0)
                      ('hi-blue-b . 0))))))

(defun init-misc/post-init-fcitx ()
  (fcitx-aggressive-setup))

(defun init-misc/init-peep-dired ()
  ;;preview files in dired
  (use-package peep-dired
    :defer t
    :commands (peep-dired-next-file
               peep-dired-prev-file)
    :bind (:map dired-mode-map
                ("P" . peep-dired))))

(defun init-misc/init-ace-isearch()
  (use-package ace-isearch
    :config
    (progn
      (global-ace-isearch-mode +1) ;; start this for global
      ;;(setq ace-isearch-funtion-from-isearch 'swoop-from-isearch) ; need to install swoop
      ;;(define-key swoop-map (kbd "C-s") 'swoop-action-goto-line-next)
      ;;(define-key swoop-map (kbd "C-r") 'swoop-action-goto-line-prev)
      (setq ace-isearch-funtion-from-isearch 'helm-swoop-from-isearch)
      ;; (setq ace-isearch-funtion-from-isearch 'helm-occur-from-isearch) ; alternative way

      ;; blew configuratioisearchn can be support for Chinese
      (defadvice ace-jump-char-category (around adv-ace-jump-support-umlauts activate)
        (unless (= (char-syntax (ad-get-arg 0)) ?w)
          ad-do-it)
        (setq ad-return-value 'alpha))

      ;; base configuration 
      (custom-set-variables
       '(ace-isearch-input-length 6)
       '(ace-isearch-jump-delay 0.25)
       '(ace-isearch-function 'ace-jump-word-mode)
       ;;'(ace-isearch-function 'avy-goto-char)
       '(ace-isearch-use-jump 'printing-char))
      (define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)
      )
    )
  )


(defun init-misc/init-multiple-cursors ()
  (use-package multiple-cursors
    :init
    (progn

      (bind-key* "C-c C-l" 'mc/edit-lines)
      (bind-key* "C-c C->" 'mc/mark-all-dwim)
      (bind-key* "C->" 'mc/mark-next-like-this)
      (bind-key* "C-<" 'mc/mark-previous-like-this)
      (bind-key* "C-M->" 'mc/unmark-next-like-this)
      (bind-key* "C-M-<" 'mc/unmark-previous-like-this)
      (bind-key* "C-c C-s-." 'mc/mark-all-like-this)

      ;; http://endlessparentheses.com/multiple-cursors-keybinds.html?source=rss
      (define-prefix-command 'endless/mc-map)
      ;; C-x m is usually `compose-mail'. Bind it to something
      ;; else if you use this command.
      (define-key ctl-x-map "m" 'endless/mc-map)
;;; Really really nice!
      (define-key endless/mc-map "i" #'mc/insert-numbers)
      (define-key endless/mc-map "h" #'mc-hide-unmatched-lines-mode)
      (define-key endless/mc-map "a" #'mc/mark-all-like-this)

;;; Occasionally useful
      (define-key endless/mc-map "d" #'mc/mark-all-symbols-like-this-in-defun)
      (define-key endless/mc-map "r" #'mc/reverse-regions)
      (define-key endless/mc-map "s" #'mc/sort-regions)
      (define-key endless/mc-map "l" #'mc/edit-lines)
      (define-key endless/mc-map "\C-a" #'mc/edit-beginnings-of-lines)
      (define-key endless/mc-map "\C-e" #'mc/edit-ends-of-lines)
      )
    :config
    (setq mc/cmds-to-run-once
          '(
            counsel-M-x
            init-misc/my-mc-mark-next-like-this))
    (setq mc/cmds-to-run-for-all
          '(
            electric-newline-and-maybe-indent
            hungry-delete-backward
            spacemacs/backward-kill-word-or-region
            spacemacs/smart-move-beginning-of-line
            evil-substitute
            lispy-move-beginning-of-line
            lispy-move-end-of-line
            lispy-space
            lispy-delete-backward
            evil-exit-visual-state
            evil-backward-char
            evil-delete-char
            evil-escape-emacs-state
            evil-escape-insert-state
            mwim-beginning-of-code-or-line
            mwim-end-of-line-or-code
            evil-exit-emacs-state
            evil-previous-visual-line
            evil-next-visual-line
            evil-forward-char
            evil-insert
            evil-next-line
            evil-normal-state
            evil-previous-line
            evil-append
            evil-append-line
            forward-sentence
            kill-sentence
            org-self-insert-command
            sp-backward-delete-char
            sp-delete-char
            sp-remove-active-pair-overlay
            orgtbl-hijacker-command-109))
    ))



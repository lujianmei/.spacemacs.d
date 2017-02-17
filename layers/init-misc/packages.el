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
        ))

;;(require 's)
(defun init-misc/init-highlight-global ()
  (use-package highlight-global
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



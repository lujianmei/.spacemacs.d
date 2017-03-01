;;;; packages.el --- lujianmei Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 lujianmei
;;
;; Author: lujianmei
;; URL: https://github.com/lujianmei/.spacemacs.d.git
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst init-ui-packages
  '(
    spaceline
    chinese-fonts
    page-break-lines
    )
  )

(defun init-ui/post-init-page-break-lines()
  (use-package page-break-lines
                                        ;  (set-fontset-font "fontset-default"
                                        ;                (cons page-break-lines-char page-break-lines-char)
                                        ;                  (face-attribute 'default :family))
    )
  (turn-on-page-break-lines-mode)
  )
(defun init-ui/post-init-spaceline()
  (require 'spaceline-config)
  ;;(spaceline-spacemacs-theme)
  (use-package nyan-mode
    :defer t
    :config
    (set nyan-animate-nyancat t)
    (setq mode-line-format
          (list
           '(:eval (list (nyan-create)))
           ))
    )
  (use-package anzu
    :defer t
    :config
    (global-anzu-mode +1))
  (spaceline-helm-mode)
  (setq spaceline-toggle-anzu-on t)
  (setq spaceline-toggle-nyan-cat-on t)
  (setq spaceline-toggle-org-pomodoro-on t)
  (setq spaceline-toggle-org-clock-on t)
  )

(defun init-ui/post-init-chinese-fonts()

  (use-package chinese-fonts-setup
    :defer t
    :config
    (setq cfs-profiles-directory "/Users/kevin/.spacemacs.d/private/fonts-setup/v3/")
    (setq cfs-profiles
          '("program" "org-mode" "read-book"))
    ;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
    )
  ;; change font size
  
  
  )

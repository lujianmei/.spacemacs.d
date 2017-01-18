;;; packages.el --- Chinese Font Setup Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Lukasz Klich <klich.lukasz@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; add font-config for chinese double-width fonts issue

(setq fonts-setup-packages
      '(chinese-fonts-setup))

(defun fonts-setup/init-chinese-fonts-setup ()
  (use-package chinese-fonts-setup
    :config
    (progn
      (setq cfs-profiles-directory "/Users/kevin/.spacemacs.d/private/fonts-setup/v3/")
      (setq cfs-profiles
            '("program" "org-mode" "read-book"))
            ;; Reset Increase Font size and Descrease Font size short key binding after using chinese-font-setup plugin
      ;; Reference: https://github.com/tumashu/chinese-fonts-setup
      (global-unset-key (kbd "C-x C-=")) ;; remove original font-resize
      (global-set-key (kbd "C-x C-=") 'cfs-increase-fontsize)
      (global-set-key (kbd "C-x M-=") 'cfs-decrease-fontsize)
      ))
  )




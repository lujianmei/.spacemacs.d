;;; config.el --- lujianmei Layer packages File for Spacemacs
 ;;
 ;; Copyright (c) 2015-2016 lujianmei
 ;;
 ;; Author: lujianmei
 ;; URL: https://github.com/lujianmei/.spacemacs.d.git
 ;;
 ;; This file is not part of GNU Emacs.
 ;;
;;; License: GPLv3


(defun init/dired-up-directory()
  "goto up directory and resue buffer"
  (interactive)
  (find-alternate-file ".."))

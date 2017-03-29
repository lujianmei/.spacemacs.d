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

(defconst init-programming-packages
  '(
    ;;gradle-mode
    kotlin-mode
    )
  )


(defun init-programming/init-kotlin-mode ()
  (use-package kotlin-mode
    :defer t
    ;; This has to be in init because it's a package entry point
    :ensure t
    ))

(defun init-programming/init-gradle-mode()
  (use-package gradle-mode
    :defer t
    :ensure t))




;;; packages.el ends here

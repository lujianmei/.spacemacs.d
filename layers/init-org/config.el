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

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
;; add some capture config
(setq org-directory "~/workspace/github/my-blog/work-notes/captures")
;;================================================================
;; Config for Picture Drawing
;;================================================================
;; set for plantuml
(setq org-ditaa-jar-path "~/.spacemacs.d/third-plugins/ditaa0_9.jar")
(setq org-plantuml-jar-path "~/.spacemacs.d/third-plugins/plantuml.8031.jar")
;; config for org-projectile
(setq org-projectile-file "~/workspace/github/my-blog/work-notes/project-documents/")
(setq org-agenda-files (list "~/workspace/github/my-blog/work-notes/project-documents/"))
                                       ;

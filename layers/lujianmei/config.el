;; We define prefix commands only for the sake of which-key
(setq spacemacs/key-binding-prefixes '(("a"   "applications")
                                       ("ai"  "irc")
                                       ("as"  "shells")
                                       ("b"   "buffers")
                                       ("c"   "compile/comments")
                                       ("C"   "capture/colors")
                                       ("e"   "errors")
                                       ("f"   "files")
                                       ("fC"  "files/convert")
                                       ("fe"  "emacs(spacemacs)")
                                       ("fv"  "variables")
                                       ("g"   "git/versions-control")
                                       ("h"   "help")
                                       ("hd"  "help-describe")
                                       ("i"   "insertion")
                                       ("j"   "jump/join/split")
                                       ("k"   "lisp")
                                       ("kd"  "delete")
                                       ("kD"  "delete-backward")
                                       ("k`"  "hybrid")
                                       ("n"   "narrow/numbers")
                                       ("N"   "navigation")
                                       ("p"   "projects")
                                       ("p$"  "projects/shell")
                                       ("q"   "quit")
                                       ("r"   "registers/rings/resume")
                                       ("Re"  "elisp")
                                       ("Rp"  "pcre")
                                       ("s"   "search/symbol")
                                       ("sa"  "ag")
                                       ("sg"  "grep")
                                       ("sk"  "ack")
                                       ("sr"  "ripgrep")
                                       ("st"  "pt")
                                       ("sw"  "web")
                                       ("t"   "toggles")
                                       ("tC"  "colors")
                                       ("tE"  "editing-styles")
                                       ("th"  "highlight")
                                       ("tm"  "modeline")
                                       ("T"   "UI toggles/themes")
                                       ("C-t" "other toggles")
                                       ("w"   "windows")
                                       ("wp"  "popup")
                                       ("x"   "text")
                                       ("xa"  "align")
                                       ("xd"  "delete")
                                       ("xg"  "google-translate")
                                       ("xl"  "lines")
                                       ("xm"  "move")
                                       ("xt"  "transpose")
                                       ("o"   "org-mode")
                                       ("xw"  "words")
                                       ("z"   "zoom")))

(defvar org-agenda-dir ""
  "gtd org files location")

(defvar deft-dir ""
  "deft org files locaiton")

(defvar blog-admin-dir ""
  "blog-admin files location")


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

;; define a default task for not record task
(defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")
(defvar eating-time-task-id "eating-time-task")
(defvar sleep-time-task-id "sleep-time-task")

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
;; config for org-projectile
(setq org-projectile-file "~/workspace/github/my-blog/work-notes/notes/projects-file.org")
;; define the refile targets
(setq
 org-directory "~/workspace/github/my-blog/work-notes/captures"
 org-agenda-dir-current-year "~/workspace/github/my-blog/work-notes/agendas/2017/"
 deft-dir "~/workspace/github/my-blog/work-notes/agendas/2017/"
 blog-admin-dir "~/workspace/github/my-blog"
 
 
 ;;org-agenda-files (list "~/workspace/github/my-blog/work-notes/project-documents/")
 snippet-dir "~/.spacemacs.d/snippets"
 )


(setq org-agenda-file-workgtd (expand-file-name "work-tasks-gtd.org" org-agenda-dir-current-year))
(setq org-default-notes-file (expand-file-name "work-tasks-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-englishgtd (expand-file-name "english-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-personalgtd (expand-file-name "personal-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-dailygtd (expand-file-name "daily-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-datacentergtd (expand-file-name "data-center-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-datascientistsgtd (expand-file-name "data-scientist-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-cisspgtd (expand-file-name "cissp-gtd.org" org-agenda-dir-current-year))
(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir-current-year))

(setq org-agenda-file-code-snippet (expand-file-name "snippets.org" snippet-dir))
(setq org-agenda-files (quote ("~/workspace/github/my-blog/work-notes/agendas/2017/"
                               "~/workspace/github/my-blog/work-notes/agendas/2018/")))

(setq mode-line-org-clock t)

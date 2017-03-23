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

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
;; config for org-projectile
(setq org-projectile-file "~/workspace/github/my-blog/work-notes/project-documents/projects-file.org")
;; define the refile targets
(setq
 org-directory "~/workspace/github/my-blog/work-notes/captures"
 org-agenda-dir "~/workspace/github/my-blog/work-notes/agenda-notes"
 deft-dir "~/workspace/github/my-blog/work-notes/agenda-notes"
 blog-admin-dir "~/workspace/github/my-blog"
 
 
 ;;org-agenda-files (list "~/workspace/github/my-blog/work-notes/project-documents/")
 snippet-dir "~/.spacemacs.d/snippets"
 )


(setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
(setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
(setq org-agenda-file-aigtd (expand-file-name "ai-gtd.org" org-agenda-dir))
(setq org-agenda-file-journal (expand-file-name "journals.org" org-agenda-dir))
(setq org-agenda-file-code-snippet (expand-file-name "snippets.org" snippet-dir))
(setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
(setq org-agenda-files (list org-agenda-dir))

(setq mode-line-org-clock t)

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
(with-eval-after-load 'org
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

  ;;================================================================
  ;; Config for Global function
  ;;================================================================
  ;; auto save files
  (run-at-time "00:59" 3600 'org-save-all-org-buffers)

  ;; org-mode
  (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


  ;; set export table's format
  (setq org-table-export-default-format "orgtbl-to-csv")

  (custom-set-variables
   '(org-export-table-data-tags '("<tr class=\"CUSTOM_ID>" . "</t>")))

  ;; auto load markdown-mode when load org-mode
  (eval-after-load "org"
    '(require 'ox-md nil t))

  ;;================================================================
  ;; Config for Org Capture
  ;;================================================================
  ;; config for org-mode
  ;; add some capture config
  (setq org-directory "~/workspace/github/my-blog/work-notes/captures")
  ;;(setq org-default-notes-file (concat org-directory "/notes.org"))
  ;;(define-key global-map (kbd "M-<f6>") 'org-capture)


  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
  (setq org-capture-templates
        (quote (("t" "TODO" entry (file (concat org-directory "/refile.org"))
                 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                ("r" "RESPONED" entry  (file (concat org-directory "/refile.org"))
                 "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                ("n" "NOTES" entry  (file (concat org-directory "/notes.org"))
                 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                ("j" "Journal" entry  (file (concat org-directory "/refile.org"))
                 "* %?\n%U\n" :clock-in t :clock-resume t)
                ("w" "org-protocol" entry  (file (concat org-directory "/refile.org"))
                 "* TODO Review %c\n%U\n" :immediate-finish t)
                ("m" "Meeting" entry  (file (concat org-directory "/refile.org"))
                 "* MEETING with %? :MEETING:\n  :SUBJECT:\n%U\n" :clock-in t :clock-resume t)
                ("p" "Phone call" entry  (file (concat org-directory "/refile.org"))
                 "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                ("h" "Habit" entry  (file (concat org-directory "/refile.org"))
                 "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

  ;; add ~/notes/front-end-dev-plan.org into agenda

  (global-set-key "\C-c a" 'org-agenda)
  ;; I use C-c c to start capture mode
  (global-set-key (kbd "C-c c") 'org-capture)

  ;;================================================================
  ;; Config for Refile
  ;;================================================================
  ;;


  ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                   (org-agenda-files :maxlevel . 9))))

  ;; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)

  ;; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  (setq ido-everywhere t)
  (setq ido-max-directory-size 100000)
  (ido-mode (quote both))
  ;; Use the current window when visiting files and buffers with ido
  (setq ido-default-file-method 'selected-window)
  (setq ido-default-buffer-method 'selected-window)
  ;; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
  ;; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;;================================================================
  ;; Config for Clock
  ;;================================================================
  ;;

  ;;
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;;
  ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 23)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Change tasks to NEXT when clocking in
  (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;; Separate drawers for clocking and logs
  (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; Save clock data and state changes and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; Do not prompt to resume an active clock
  (setq org-clock-persist-query-resume nil)
  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)

  (setq bh/keep-clock-running nil)

  ;; config for clocking
  ;; (global-set-key (kbd "<f9> I") 'bh/punch-in)
  ;; (global-set-key (kbd "<f9> O") 'bh/punch-out)

  ;; (global-set-key (kbd "<f9> l") 'org-toggle-link-display)
  ;; (global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)

  ;; (global-set-key (kbd "<f11>") 'org-clock-goto)
  ;; (global-set-key (kbd "C-<f11>") 'org-clock-in)

  ;;================================================================
  ;; Config for Picture Drawing
  ;;================================================================
  ;; set for plantuml
  (setq org-ditaa-jar-path "~/.spacemacs.d/third-plugins/ditaa0_9.jar")
  (setq org-plantuml-jar-path "~/.spacemacs.d/third-plugins/plantuml.8031.jar")
  ;; Use fundamental mode when editing plantuml blocks with C-c '
  (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

  ;;================================================================
  ;; Config for TODO Configuration
  ;;================================================================
  ;; (setq org-todo-keywords
  ;;       (quote (;;(sequence "TODO(t)" "NEXT(n)" "MAYBE(m)" "STARTED(s)" "APPT(a)" "|" "DONE(d)")
  ;;               (sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
  ;;               (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "MAYBE(m)" "|" "DONE(d!/!)")
                (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
                (sequence "WAITING(w@/!)" "HOLD(h)" "|" "CANCELLED(c@/!)"))))

  (setq org-todo-keyword-faces
        (quote (;;("NEXT" :inherit warning)
                ("PROJECT" :inherit font-lock-string-face)
                ("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("STARTED" :foreground "green" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("MAYBE" :foreground "grey" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                )))


  (setq org-use-fast-todo-selection t)
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("MAYBE" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  ;;================================================================
  ;; Config for Tags
  ;;================================================================
  ;; Config TODO tags
  (setq org-tag-alist '((:startgroup)
                        ("Develop" . ?1)
                        (:grouptags )
                        ("陆健美" . ?z)
                        (:endgroup)

                        ))
  ;; Allow setting single tags without the menu
  (setq org-fast-tag-selection-single-key (quote expert))

  ;; For tag searches ignore tasks with scheduled and deadline dates
  (setq org-agenda-tags-todo-honor-ignore-options t)

  ;;================================================================
  ;; Config for Global column view and properties
  ;;================================================================
  ;; Set default column view headings: Task Effort Clock_Summary
  ;;(setq org-columns-default-format "%25ITEM %10Effort(Effort){:} %SCHEDULED %DEADLINE %11Status %20TAGS %PRIORITY %TODO")
  ;;(setq org-columns-default-format "%25ITEM  %9Approved(Approved?){X} %SCHEDULED %DEADLINE %11Status %TAGS %PRIORITY %TODO")
  (setq org-columns-default-format
        ;;" %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:} %6CLOCKSUM"
        " %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:}"
        )

  ;; global Effort estimate values
  ;; global STYLE property values for completion
  (setq org-global-properties (quote (
                                      ;;("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("Status_ALL" . "Not-start In-Progress Delay Finished Cancled")
                                      ("ID_ALL" . "")
                                      ("STYLE_ALL" . "habit"))))
  ;; update dynamic blocks when save file
  (add-hook 'before-save-hook 'org-update-all-dblocks)

  ;;================================================================
  ;; Config for File Export HTML Format
  ;;================================================================ 

  ;; Increase default number of headings to export
  (setq org-export-headline-levels 6)
  ;; List of projects
  ;; Work-notes

  (setq org-publish-project-alist

        ;; (work notes for)
        (quote (("work-notes"
                 :base-directory "~/workspace/github/my-blog/work-notes/"
                 :publishing-directory "~/workspace/github/my-blog/publish-works"
                 :recursive t
                 :table-of-contents t
                 :base-extension "org"
                 :publishing-function org-html-publish-to-html
                 :style-include-default t
                 :section-numbers y
                 :table-of-contents y
                 :author-info y
                 :creator-info y)
                ("work-notes-extra"
                 :base-directory "~/workspace/github/my-blog/work-notes/"
                 :publishing-directory "~/workspace/github/my-blog/publish-works"
                 :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
                 :publishing-function org-publish-attachment
                 :recursive t
                 :author nil)
                ("worknotes"
                 :components ("work-notes" "work-notes-extra"))
                )))
  ;; set parent node into DONE when all sub-tasks are done in org mode
  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  ;; 各种Babel语言支持
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (emacs-lisp . t)
     (matlab . t)
     (C . t)
     (perl . t)
     ;;(objc . t)
     (shell . t)
     (ditaa . t)
     (plantuml . t)
     (org . t)
     (python . t)
     (sh . t)
     (dot . t)
     (haskell . t)
     (dot . t)
     (latex . t)
     (java . t)
     (js . t)
     ))
  (setq org-confirm-babel-evaluate nil)




;; config for org-projectile
(setq org-projectile-file "~/workspace/github/my-blog/work-notes/project-documents/")
(setq org-agenda-files (list "~/workspace/github/my-blog/work-notes/project-documents/"))

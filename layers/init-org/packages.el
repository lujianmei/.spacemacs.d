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

(defconst init-org-packages
  '(
    ;;(org :location built-in)
    org
    org-mac-link
    org-promodoro
    ;;deft
    org2jekyll
    org-alert
    )
  )
(defun init-org/post-init-org-alert ()
  (use-package org-alert
    :defer t
    :ensure t
    :init
    (progn
      (setq alert-default-style 'notifier))))

(defun init-org/post-init-org-promodoro ()
  (progn
    (add-hook 'org-pomodoro-finished-hook '(lambda () (init-org/growl-notification "Pomodoro Finished" "☕️ Have a break!" t)))
    (add-hook 'org-pomodoro-short-break-finished-hook '(lambda () (init-org/growl-notification "Short Break" "🐝 Ready to Go?" t)))
    (add-hook 'org-pomodoro-long-break-finished-hook '(lambda () (init-org/growl-notification "Long Break" " 💪 Ready to Go?" t)))
    ))


;;In order to export pdf to support Chinese, I should install Latex at heSymbol’s function definition is void: eSymbol’s function definition is void: evil-define-keyvil-define-keyr(require 'org-id) e: https://www.tug.org/mactex/
;; http://freizl.github.io/posts/2012-04-06-export-orgmode-file-in-Chinese.html
;;http://stackoverflow.com/questions/21005885/export-org-Symbol’s function definition is void: evil-define-keymode-code-block-and-result-with-different-styles
(defun init-org/post-init-org ()
 (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
 (with-eval-after-load 'org
    (progn
      
      (spacemacs|disable-company org-mode)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "," 'org-priority)
      (require 'org)
      (require 'org-compat)
      
      ;; (add-to-list 'org-modules "org-habit")
      (add-to-list 'org-modules 'org-habit)
      (require 'org-habit)

      (setq org-refile-use-outline-path 'file)
      (setq org-outline-path-complete-in-steps nil)
      (setq org-refile-targets
            '((nil :maxlevel . 9)
              (org-agenda-files :maxlevel . 9)))
      ;; config stuck project
      (setq org-stuck-projects
            '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

      (setq org-agenda-inhibit-startup t) ;; ~50x speedup
      (setq org-agenda-span 'day)
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (setq org-agenda-window-setup 'current-window)
      (setq org-log-done t)

      ;; 加密文章
      ;; "http://coldnew.github.io/blog/2013/07/13_5b094.html"
      ;; org-mode 設定
      (require 'org-crypt)

      ;; 當被加密的部份要存入硬碟時，自動加密回去
      (org-crypt-use-before-save-magic)

      ;; 設定要加密的 tag 標籤為 secret
      (setq org-crypt-tag-matcher "secret")

      ;; 避免 secret 這個 tag 被子項目繼承 造成重複加密
      ;; (但是子項目還是會被加密喔)
      (setq org-tags-exclude-from-inheritance (quote ("secret")))

      ;; 用於加密的 GPG 金鑰
      ;; 可以設定任何 ID 或是設成 nil 來使用對稱式加密 (symmetric encryption)
      (setq org-crypt-key nil)

      ;; (add-to-list 'auto-mode-alist '("\.org\\'" . org-mode))





      (require 'org-id)
      
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

      ;; auto save files
      (run-at-time "00:59" 3600 'org-save-all-org-buffers)

      (custom-set-variables
       '(org-export-table-data-tags '("<tr class=\"CUSTOM_ID>" . "</t>")))

      ;; set export table's format
      (setq org-table-export-default-format "orgtbl-to-csv")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      ;;(setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'init-org/org-insert-src-block)))


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
      ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
      (setq org-clock-out-when-done t)
      ;; Save the running clock and all clock history when exiting Emacs, load it on startup
      (setq org-clock-persist t)
      ;; Do not prompt to resume an active clock
      (setq org-clock-persist-query-resume nil)
      ;; Enable auto clock resolution for finding open clocks
      (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
      ;; Include current clocking task in clock reports
      (setq org-clock-report-include-clocking-task t)

      (add-hook 'org-pomodoro-killed-hook 'bh/clock-in-organization-task-as-default)

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org publish
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      (require 'ox-publish)

      ;; update dynamic blocks when save file
      ;;(add-hook 'before-save-hook 'org-update-all-dblocks) commend because it is too slow in gtd.org

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
      

      ;;================================================================
      ;; Config for File Export PDF format
      ;;================================================================ 
      (add-to-list 'org-latex-classes '("ctexart" "\\documentclass[11pt]{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\tolerance=1000
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
                                        \\lstset{
                                        %行号
                                        numbers=left,
                                        %背景框
                                        framexleftmargin=10mm,
                                        frame=none,
                                        %背景色
                                        %backgroundcolor=\\color[rgb]{1,1,0.76},
                                        backgroundcolor=\\color[RGB]{245,245,244},
                                        %样式
                                        keywordstyle=\\bf\\color{blue},
                                        identifierstyle=\\bf,
                                        numberstyle=\\color[RGB]{0,192,192},
                                        commentstyle=\\it\\color[RGB]{0,96,96},
                                        stringstyle=\\rmfamily\\slshape\\color[RGB]{128,0,0},
                                        %显示空格
                                        showstringspaces=false
                                        }
                                        "
                                        ("\\section{%s}" . "\\section*{%s}")
                                        ("\\subsection{%s}" . "\\subsection*{%s}")
                                        ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                        ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                        ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


      ;; {{ export org-mode in Chinese into PDF
      ;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
      ;; and you need install texlive-xetex on different platforms
      ;; To install texlive-xetex:
      ;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
      ;; }}
      (setq org-latex-default-class "ctexart")
      (setq org-latex-pdf-process
            '(
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "xelatex -interaction nonstopmode -output-directory %o %f"
              "rm -fr %b.out %b.log %b.tex auto"))

      (setq org-latex-listings t)

      ;;reset subtask
      (setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

      ;; (add-hook 'org-after-todo-state-change-hook 'org-subtask-reset)

      ;; Use fundamental mode when editing plantuml blocks with C-c '
      (add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))


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



      (require 'ox-md nil t)

      ;;================================================================
      ;; Config for Org Agenda
      ;;================================================================
      ;; config for org-mode
      ;;(setq org-default-notes-file (concat org-directory "/notes.org"))
      ;;(define-key global-map (kbd "M-<f6>") 'org-capture)


      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )

      ;; the %i would copy the selected text into the template
      ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
      ;;add multi-file journal
      (setq org-capture-templates
            '(("t" "卡萨帝积分中心 TODO " entry (file+headline org-agenda-file-gtd "卡萨帝积分中心")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("d" "数据中心 TODO" entry (file+headline org-agenda-file-gtd "数据中心")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("a" "AI项目" entry (file+headline org-agenda-file-gtd "AI智能桌面")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("r" "Book Reading TODO" entry (file+headline org-agenda-file-gtd "Reading")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("w" "Writing TODO" entry (file+headline org-agenda-file-gtd "Writing")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("h" "会议安排" entry (file+headline org-agenda-file-gtd "会议安排")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("o" "其它" entry (file+headline org-agenda-file-gtd "Others")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("m" "午睡" entry (file+headline org-agenda-file-gtd "午睡")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("q" "问题记录" entry (file+headline org-agenda-file-note "问题记录")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
               "* TODO [#B] %?\n  %i\n %U"
               :empty-lines 1)
              ("s" "Code Snippet" entry
               (file org-agenda-file-code-snippet)
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("c" "Chrome" entry (file+headline org-agenda-file-note "Links")
               "* TODO [#C] %?\n %(init-org/retrieve-chrome-current-tab-url)\n %i\n %U"
               :empty-lines 1)
              ("j" "Journal Entry"
               entry (file+datetree org-agenda-file-journal)
               "* %?"
               :empty-lines 1)))

      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("w" . "任务安排")
              ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
              ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "项目安排")
              ("pw" tags-todo "PROJECT+WORK+CATEGORY=\"Data-Center\"")
              ("pl" tags-todo "PROJECT+DREAM+CATEGORY=\"projects\"")
              ("W" "Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))


      (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
      (define-key org-mode-map (kbd "s-p") 'org-priority)
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "tl" 'org-toggle-link-display)
      (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)



     ;;================================================================
      ;; Config for Global column view and properties
      ;;================================================================
      ;; Set default column view headings: Task Effort Clock_Summary
      ;;(setq org-columns-default-format "%25ITEM %10Effort(Effort){:} %SCHEDULED %DEADLINE %11Status %20TAGS %PRIORITY %TODO")
      ;;(setq org-columns-default-format "%25ITEM  %9Approved(Approved?){X} %SCHEDULED %DEADLINE %11Status %TAGS %PRIORITY %TODO")
      
      (setq org-columns-default-format
            ;;" %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:} %6CLOCKSUM"
            " %TODO %30ITEM %15DEADLINE %15SCHEDULED %3PRIORITY %10TAGS %5Effort(Effort){:} %6CLOCKSUM"
            )

      ;; global Effort estimate values
      ;; global STYLE property values for completion
      (setq org-global-properties (quote (
                                          ;;("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                          ("Status_ALL" . "Not-start In-Progress Delay Finished Cancled")
                                          ("ID_ALL" . "")
                                          ("STYLE_ALL" . "habit"))))

      ;;================================================================
      ;; Config for Tags
      ;;================================================================
      ;; Config TODO tags
                                        ; Tags with fast selection keys
      (setq org-tag-alist (quote ((:startgroup)
                                  ("@errand" . ?e)
                                  ("@office" . ?o)
                                  ("@home" . ?H)
                                  ("@farm" . ?f)
                                  (:endgroup)
                                  ("WAITING" . ?w)
                                  ("HOLD" . ?h)
                                  ("PERSONAL" . ?P)
                                  ("WORK" . ?W)
                                  ("FARM" . ?F)
                                  ("ORG" . ?O)
                                  ("NORANG" . ?N)
                                  ("crypt" . ?E)
                                  ("NOTE" . ?n)
                                  ("CANCELLED" . ?c)
                                  ("FLAGGED" . ??))))

      ;; Allow setting single tags without the menu
      (setq org-fast-tag-selection-single-key (quote expert))

      ;; For tag searches ignore tasks with scheduled and deadline dates
      (setq org-agenda-tags-todo-honor-ignore-options t)



)))






(defun init-org/post-init-org2jekyll ()
;; 添加org-jekyll包
  (use-package org2jekyll
    :defer 3
    :ensure t
    :config
    (custom-set-variables '(org2jekyll-blog-author "lujianmei")
                      '(org2jekyll-source-directory (expand-file-name "~/workspace/github/my-blog/work-notes/notes/"))
                      '(org2jekyll-jekyll-directory (expand-file-name "~/workspace/github/my-blog/"))
                      '(org2jekyll-jekyll-drafts-dir "")
                      '(org2jekyll-jekyll-posts-dir "_posts/")
                      '(org-publish-project-alist
                        `(("default"
                           :base-directory ,(org2jekyll-input-directory)
                           :base-extension "org"
                           :publishing-directory ,(org2jekyll-output-directory)
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers t
                           :with-toc nil
                           ;; :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index nil
                           :html-extension "html"
                           :body-only t)
                          ("post"
                           :base-directory ,(org2jekyll-input-directory)
                           :base-extension "org"
                           :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers t
                           :with-toc nil
                           ;; :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index nil
                           :html-extension "md"
                           :body-only t)
                          ("images"
                           :base-directory ,(org2jekyll-input-directory "img")
                           :base-extension "jpg\\|gif\\|png"
                           :publishing-directory ,(org2jekyll-output-directory "img")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("js"
                           :base-directory ,(org2jekyll-input-directory "js")
                           :base-extension "js"
                           :publishing-directory ,(org2jekyll-output-directory "js")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("css"
                           :base-directory ,(org2jekyll-input-directory "css")
                           :base-extension "css\\|el"
                           :publishing-directory ,(org2jekyll-output-directory "css")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("web" :components ("images" "js" "css"))
                          ))))


)


(defun init-org/init-org-mac-link ()
  (use-package org-mac-link
    :commands org-mac-grab-link
    :init
    (progn
      (add-hook 'org-mode-hook
                (lambda ()
                  (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))))
    :defer t
    :ensure t))




(defun init-org/init-org-tree-slide ()
  (use-package org-tree-slide
    :ensure t
    :init
    (spacemacs/set-leader-keys "oto" 'org-tree-slide-mode)))


(defun init-org/init-org-download ()
  (use-package org-download
    :defer t
    :init
    (org-download-enable)))


(defun init-org/init-worf ()
  (use-package worf
    :defer t
    :init
    (add-hook 'org-mode-hook 'worf-mode)))

;;; packages.el ends here

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

(require 'org-id)
;; 添加org-jekyll包
  (use-package org2jekyll
    :defer 3
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



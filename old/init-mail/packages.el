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

(defconst init-mail-packages
  '(
    mu4e
    )

  )

(defun init-mail/post-init-mu4e()
  (with-eval-after-load 'mu4e

    ;;================================================================
    ;; Config for email client mu4e
    ;;================================================================
    (message "Start load mu4e configuration")
    
    (require 'smtpmail)
    (require 'starttls)

    ;; Reading email config
    ;;(setq mu4e-maildir "~/.mutt/mails/lu.jianmei")
    (setq mu4e-maildir "~/Maildir/lu.jianmei")
    (setq mu4e-attachment-dir "~/MailAttachments")

    (setq mu4e-drafts-folder "/草稿箱"
          mu4e-sent-folder   "/已发送"  ;; config for the sent, drafts folder mapping in Maildir (synced by offlineimap)
          mu4e-trash-folder  "/已删除"
          ;;mu4e-sent-messages-behavior 'delete
          mu4e-get-mail-command "offlineimap"
          mu4e-update-interval 60
          user-mail-address "lu.jianmei@trs.com.cn"
          user-full-name  "Lu Jianmei"
          mu4e-maildir-shortcuts
          '( ("/INBOX"               . ?i)
             ("/haier"   . ?h)
             ("/pm"       . ?p)
             ("/trs"       . ?t)
             ("/已发送"       . ?s)
             ("/me"       . ?m)
             ("/waitting"       . ?w)
             ("/草稿箱"       . ?d)
             ("/已删除"       . ?r)
             ;;("/Gmail/[Gmail].All Mail"    . ?a)
             )
          ;;message-signature
          mu4e-compose-signature
          (concat

           "All My Best Regards!"
           " \n "
           "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
           " \n "
           "陆健美            项目总监                                                      "
           " \n "
           
           "地址：上海市浦东新区峨山路91弄61号陆家嘴软件园10号楼10楼东单元                                        "
           "青岛市市南区山东路2号甲，华仁国际大厦28楼BCD室                                                        "
           " \n "
           "手机: 18661813293"
           " \n "
           "邮箱：lu.jianmei@trs.com.cn"
           " \n "
           "官网:www.trs.com.cn                      "
           " \n "
           "\n")

          mu4e-view-show-images t
          mu4e-view-prefer-html t
        ;;; (setq mu4e-html2text-command "html2text")
          ;; mu4e-html2text-command "html2text -utf8 -nobs -width 72"
          ;; when is macos
        ;;; mu4e-html2text-command "textutil -stdin -format html -convert txt -stdout"
          mu4e-html2text-command "w3m -dump -T text/html -M"
          mail-user-agent 'mu4e-user-agent
          ;; don't keep message buffers around
          message-kill-buffer-on-exit t)
    (when (fboundp 'imagemagick-register-types)
      (imagemagick-register-types))

    (setq mu4e-headers-results-limit 1000)

    ;; ;; Send email config
    ;; (setq message-send-mail-function 'smtpmail-send-it
    ;;       smtpmail-stream-type 'starttls
    ;;       smtpmail-default-smtp-server "smtp.qiye.163.com"
    ;;       smtpmail-smtp-server "smtp.qiye.163.com"
    ;;       smtpmail-smtp-service 25 ;;587(starttls) or 465(tls/ssl) or ?

    ;;       ;;tls-program '("gnutls-cli --priority NORMAL:%COMPAT -p %p %h")
    ;;       ;;starttls-gnutls-program "gnutls-cli --priority NORMAL:%COMPAT"
    ;;       starttls-gnutls-program "gnutls"
    ;;       starttls-use-gnutls t
    ;;       smtpmail-debug-info t
    ;;       smtpmail-debug-verb t

    ;;       ;;starttls-extra-arguments '("--priority NORMAL:%COMPAT")
    ;;       starttls-extra-arguments '("--insecure")
    ;;       )

    ;; otherwise it tries to send through OS associated mail client
    (setq message-send-mail-function 'message-send-mail-with-sendmail)
    ;; we substitute sendmail with msmtp
    (setq sendmail-program "/usr/local/Cellar/msmtp/1.6.6/bin/msmtp")
    ;;need to tell msmtp which account we're using
    ;;(setq message-sendmail-extra-arguments '("--read-envelop-from"))
    (setq message-sendmail-f-is-evil 't)

    ;; you might want to set the following too

    ;; use helm-mu for search email and contacts etc.
    ;;(use-package helm-mu)

    (add-hook 'mu4e-compose-mode-hook
              (defun my-add-bcc ()
                "Add a Bcc: header."
                (save-excursion (message-add-header "Bcc: lu.jianmei@trs.com.cn\n"))))

    ;; (setq mu4e-enable-mode-line t)
    (with-eval-after-load 'mu4e-alert
      ;; Enable Desktop notifications
      ;;  (mu4e-alert-set-default-style 'notifications)) ; For linux
      ;; (mu4e-alert-set-default-style 'libnotify))  ; Alternative for linux
                                        ;(mu4e-alert-set-default-style 'notifier))   ; For Mac OSX (through the
                                        ; terminal notifier app)
      (mu4e-alert-set-default-style 'growl) ; Alternative for Mac OSX
      (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
      (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
      )




    )
  
  )

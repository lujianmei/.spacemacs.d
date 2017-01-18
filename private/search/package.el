;;; packages.el --- Search function for spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Lukasz Klich <klich.lukasz@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; add search function addtion packages support

(setq search-packages
      '(ace-isearch))

(defun search/init-ace-isearch ()

(use-package avy
  :defer t)
  ;; I use the jj key-chord for this; see the definitions for key-chord
(use-package avy-zap
  :defer t
  :bind
  (("M-z" . avy-zap-up-to-char-dwim)
   ("M-Z" . avy-zap-to-char-dwim)))

(use-package ace-isearch
  :config
  (progn
    (global-ace-isearch-mode +1) ;; start this for global
    ;;(setq ace-isearch-funtion-from-isearch 'swoop-from-isearch) ; need to install swoop
    ;;(define-key swoop-map (kbd "C-s") 'swoop-action-goto-line-next)
    ;;(define-key swoop-map (kbd "C-r") 'swoop-action-goto-line-prev)
    (setq ace-isearch-funtion-from-isearch 'helm-swoop-from-isearch)
    ;; (setq ace-isearch-funtion-from-isearch 'helm-occur-from-isearch) ; alternative way

    ;; blew configuration can be support for Chinese
    (defadvice ace-jump-char-category (around adv-ace-jump-support-umlauts activate)
      (unless (= (char-syntax (ad-get-arg 0)) ?w)
        ad-do-it)
      (setq ad-return-value 'alpha))

    ;; base configuration 
    (custom-set-variables
     '(ace-isearch-input-length 6)
     '(ace-isearch-jump-delay 0.25)
     '(ace-isearch-function 'ace-jump-word-mode)
     ;;'(ace-isearch-function 'avy-goto-char)
     '(ace-isearch-use-jump 'printing-char))
    (define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)
    )
)

)
  

;;================================================================
;; Config for java development
;;================================================================

(setq eclim-eclipse-dirs "~/develop/eclipse/Eclipse.app/Contents/Eclipse/"
      eclim-executable "~/develop/eclipse/Eclipse.app/Contents/Eclipse/eclim")
(setq
 ;; Use another eclimd executable
 eclimd-executable "~/develop/eclipse/Eclipse.app/Contents/Eclipse/eclimd"
 ;; Specify the workspace to use by default
 eclimd-default-workspace "~/workspace/"
 ;; Whether or not to block emacs until eclimd is ready
 eclimd-wait-for-process t)


(provide 'init-java)

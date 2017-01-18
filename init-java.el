;;================================================================
;; Config for java development
;;================================================================

(setq eclim-eclipse-dirs "~/develop/eclipse/"
      eclim-executable "~/develop/eclipse/")
(setq
 ;; Use another eclimd executable
 eclimd-executable "/path/to/another/executable"
 ;; Specify the workspace to use by default
 eclimd-default-workspace "~/workspace/"
 ;; Whether or not to block emacs until eclimd is ready
 eclimd-wait-for-process t)



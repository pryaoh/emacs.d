;;; core-package.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2007-2019 Younan oh

;; Author: Younan Oh <pryaoh@gmail.com>

;; This file is not part of GNU Emacs.
;;
;; LICENSE:MIT
;;

;;; Commentary:
;;
;;  core file for yaoh-emacs
;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Configure PackageManager++

;; avoid init.el, custom.el packaged-seleced-packages
;; @See https://www.reddit.com/r/emacs/comments/4x655n/packageselectedpackages_always_appear_after/
(defun package--save-selected-packages (&optional value)
  "Set and save `package-selected-packages' to VALUE."
  (when value
    (setq package-selected-packages value)))


;;Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
   (setq package-enable-at-startup nil)          ; To prevent initializing twice
   (package-initialize))


;; set package files location
;; @See https://www.gnu.org/software/emacs/manual/html_node/emacs/Package-Files.html#Package-Files
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;; Set Package Repository
(setq package-archives
      '( ("org"       . "http://orgmode.org/elpa/")
			   ("gnu"       . "http://elpa.gnu.org/packages/")
			   ("melpa-stable" . "https://stable.melpa.org/packages/")
			   ("melpa"     . "http://melpa.org/packages/")
        ))

;; set use-package-verbose to t for interpreted .emacs,
;; and to nil for byte-compiled .emacs.elc.
(eval-and-compile
 (setq use-package-verbose (not (bound-and-true-p byte-compile-current-file))))


;; Install use-package if not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(eval-and-compile
 (setq use-package-always-ensure t)
 (setq use-package-expand-minimally t)
 (setq use-package-compute-statistics t)
 (setq use-package-enable-imenu-support t))


;; --Configure PackageManager-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++AutoPackageUpdate++

(use-package auto-package-update
  :init
  (setq auto-package-update-interval 7 ;; in days
      auto-package-update-prompt-before-update t
      auto-package-update-delete-old-versions t
      auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))

;; --AutoPackageUpdate-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Diminish++

;;(use-package diminish)
(use-package bind-key)
;; --Diminish--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(provide 'core-package)

;;; core-package.el ends here

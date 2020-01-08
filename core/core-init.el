;;; core-init.el --- -*- lexical-binding: t -*-
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

(require 'core-const)
(require 'core-funcs)
(require 'core-package)


(defvar laonemacs-initialized-p nil
  "Whether or not laonemacs initialized.")

(defun laonemacs/init ()

  (laonemacs/removes-gui-elements)
  (prefer-coding-system 'utf-8)

  (setq inhibit-startup-screen t)



  )

(defun laonemacs/removes-gui-elements ()
  "Remove the menu bar, tool bar and scroll bars."
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))

  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))

  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1))
  )

(defun laonemacs/setup-startup-hook ()
  "Add startup hook."
  (add-hook 'emacs-startup-hook
    (defun laonemacs/startup-hook ()

      ;; restore Garbage collection
      (setq gc-cons-threshold (car dotlaonemacs-gc-cons)
            gc-cons-percentage (cadr dotlaonemacs-gc-cons))))

      (setq yaoh-emacs-initialzed-p t)
  )


(provide 'core-init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; core-init.el ends here

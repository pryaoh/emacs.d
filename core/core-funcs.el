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

(defun laonemacs/system-is-mac ()
  (eq system-type 'darwin))

(defun laonemacs/system-is-win ()
  (eq system-type 'windows-nt))

(defun laonemacs/system-is-linux ()
  (eq system-type 'gun/linux))

(defun laonemacs/window-system-is-mac ()
  ;; ns is returned instead of mac on Emacs 25+
  (memq (window-system) '(mac ns)))


(provide 'core-funcs)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; core-funcs.el ends here

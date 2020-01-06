;;; core-load-paths.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2007-2020 Younan oh

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

(defun add-to-load-path (dir) (add-to-list 'load-path dir))

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
      (add-to-load-path dir)))


(defvar yaoh-emacs-init-directory
  user-emacs-directory
  "Yaoh-emacs init directory.")

(defconst yaoh-emacs-core-directory
  (expand-file-name (concat yaoh-emacs-init-directory "core/"))
  "Yaoh-emacs core direcotry.")

(defconst yaoh-emacs-assets-directory
  (expand-file-name (concat yaoh-emacs-init-directory "assets/"))
  "Yaoh-emacs asset direcotry.")

(defconst yaoh-emacs-tests-directory
  (expand-file-name (concat yaoh-emacs-init-directory "tests/"))
  "Yaoh-emacs tests direcotry.")

(defconst yaoh-emacs-cache-directory
  (expand-file-name (concat yaoh-emacs-init-directory ".cache/"))
  "Yaoh-emacs cache direcotry.")

(defconst yaoh-emacs-auto-save-directory
  (expand-file-name (concat yaoh-emacs-cache-directory "auto-save/"))
  "Yaoh-emacs auto-save directory")

;; load paths
(mapc 'add-to-load-path
      `(
        ,yaoh-emacs-core-directory
        ,(concat yaoh-emacs-core-directory "libs/")

        ))




(provide 'core-load-paths)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; core-load-paths.el ends here

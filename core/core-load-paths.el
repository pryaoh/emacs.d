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
;;  core file for laonemacs
;;

;;; Code:
(defun add-to-load-path (dir) (add-to-list 'load-path dir))

(defun add-to-load-path-if-exists (dir)
  "If DIR exists in the file system, add it to `load-path'."
  (when (file-exists-p dir)
      (add-to-load-path dir)))


(defvar laonemacs-init-directory
  user-emacs-directory
  "laonemacs init directory.")

(defconst laonemacs-core-directory
  (expand-file-name (concat laonemacs-init-directory "core/"))
  "laonemacs core direcotry.")

(defconst laonemacs-assets-directory
  (expand-file-name (concat laonemacs-init-directory "assets/"))
  "laonemacs asset direcotry.")

(defconst laonemacs-tests-directory
  (expand-file-name (concat laonemacs-init-directory "tests/"))
  "laonemacs tests direcotry.")

(defconst laonemacs-cache-directory
  (expand-file-name (concat laonemacs-init-directory ".cache/"))
  "laonemacs cache direcotry.")

(defconst laonemacs-auto-save-directory
  (expand-file-name (concat laonemacs-cache-directory "auto-save/"))
  "laonemacs auto-save directory")

;; load paths
(mapc 'add-to-load-path
      `(
        ,laonemacs-core-directory
        ,(concat laonemacs-core-directory "libs/")

        ))




(provide 'core-load-paths)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; core-load-paths.el ends here

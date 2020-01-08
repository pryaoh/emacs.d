;;; early-init.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2008-2020 Younan oh

;; Author: Younan Oh <pryaoh@gmail.com>

;; This file is not part of GNU Emacs.
;;
;; LICENSE:MIT

;;; Commentary:
;;
;;  early init file for yaoh-emacs (only emacs 27+)
;;

;; Earlier Emacs versions do not load the early init file and do not initialize
;; the package manager before loading the init file, so this file is neither
;; needed nor loaded on those versions.
(setq package-enable-at-startup nil)


;;; early-init.el ends here

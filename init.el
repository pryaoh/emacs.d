;;; init.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2008-2020 Younan oh

;; Author: Younan Oh <pryaoh@gmail.com>

;; This file is not part of GNU Emacs.
;;
;; LICENSE:MIT

;;; Commentary:
;;
;;  init file for laonemacs
;;

;;; Code:

(setq debug-on-error t)
(message "start laonemacs")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Preinitialize++

;; most-positive-fixnum 2^61 (largest value Lisp Integer)
(defconst my-gc-cons-threshold 402653184) ;; 2^32
(defconst my-gc-cons-percentage 0.6)

(defconst emacs-start-time (current-time))

(message "gc collect disabled")
;; avoid garbage collection during startup
(setq gc-cons-threshold my-gc-cons-threshold
      gc-cons-percentage my-gc-cons-percentage)

(message "load paths")
;; Update Load paths
(load (concat (file-name-directory load-file-name)
              "core/core-version.el")
      nil (not init-file-debug))

(load (concat (file-name-directory load-file-name)
              "core/core-load-paths.el")
      nil (not init-file-debug))

;; --Preinitialize--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Initialize++
(if (not (version<= laonemacs-emacs-min-version emacs-version))
  (error (concat "laonemacs requires emacs %s or above")
         laonemacs-min-version)

  (require 'core-init)

  (laonemacs/init)
  (laonemacs/setup-startup-hook)

  ;; Start Server
  (require 'server)
  (unless (server-running-p)
    (server-start)))

;; --Initialize--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; init.el ends here

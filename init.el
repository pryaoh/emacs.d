;;; init.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2008-2020 Younan oh

;; Author: Younan Oh <pryaoh@gmail.com>

;; This file is not part of GNU Emacs.
;;
;; LICENSE:MIT

;;; Commentary:
;;
;;  init file for yaoh-emacs
;;

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Check Emacs Version++
(when (version< emacs-version "26.1")
  "Mininum required yaoh-emacs."
  (error "Yaoh-emacs requires emacs 26.1 and above"))

;; --Check Emacs Version--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Optimize Startup++

(setq gc-cons-threshold-original gc-cons-threshold)
(defvar upper-limit-gc-cons-threshold 104857600) ;; 100 MB


(setq gc-cons-threshold upper-limit-gc-cons-threshold)

(add-hook 'emacs-startup-hook
          (lambda ()

                  ;; GC automatically while unfocusing the frame
                  (if (boundp 'after-focus-change-function)
                    (add-function :after after-focus-change-function
                                  (lambda ()
                                          (unless (frame-focus-state)
                                            (garbage-collect))))
                    (add-hook 'after-focus-change-function 'garbage-collect))

                  ;; Avoid GCs while using `ivy'/`counsel'/`swiper'
                  (defun gc-minibuffer-setup-hook ()
                    (setq gc-cons-threshold upper-limit-gc-cons-threshold))

                  (defun gc-minibuffer-exit-hook ()
                    (garbage-collect)
                    (setq gc-cons-threshold gc-cons-threshold-original))

                  (add-hook 'minibuffer-setup-hook #'gc-minibuffer-setup-hook)
                  (add-hook 'minibuffer-exit-hook #'gc-minibuffer-exit-hook)))


;; --Optimize Startup--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ++Update Load Paths++




;; --Update Load Paths--
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Start Server
(require 'server)
(unless (server-running-p)
  (server-start))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here

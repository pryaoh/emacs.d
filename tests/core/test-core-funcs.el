;;; test-core-funcs.el --- -*- lexical-binding: t -*-
;;
;; CopyRight (C) 2008-2020 Younan oh

;; Author: Younan Oh <pryaoh@gmail.com>

;; This file is not part of GNU Emacs.
;;
;; LICENSE:MIT

;;; Commentary:
;;
;;  initialization undercover
;;


(load-file "./tests/undercover-init.el")
(require 'core-funcs)

(describe "Function: check system-type"
  (before-each
    (redef 'system-type 'darwin))

  (it "check host system is mac"
    (expect (laonemacs/system-is-mac) :to-be t)))



;;; test-core-funcs.el ends here

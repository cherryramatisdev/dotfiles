;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH_______________________________________________________
;; Emacs: Font Setup http://ergoemacs.org/emacs/emacs_list_and_set_font.html

;; set default font
(set-frame-font
 (cond
  ((string-equal system-type "window-nt")
   (if (member "Consolas" (font-family-list)) "Consolas" nil))
  ((string-equal system-type "darwin")
   (if (member "Menlo" (font-family-list)) "Menlo-16" nil))
  ((string-equal system-type "gnu/linux")
   (if (member "DejaVu Sans Mono" (font-family-list)) "DejaVu Sans Mono-16" nil))
  (t nil))
 t t)

;; set font for emoji
(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji"))
 ;; Apple Color Emoji should be before Symbola, but Richard Stallman skum disabled it.
 ;; GNU Emacs Removes Color Emoji Support on the Mac
 ;; http://ergoemacs.org/misc/emacs_macos_emoji.html
 ;;
 )

;; set font for chinese characters
(set-fontset-font
 t
 '(#x4e00 . #x9fff)
 (cond
  ((string-equal system-type "windows-nt")
   (cond
    ((member "Microsoft YaHei" (font-family-list)) "Microsoft YaHei")
    ((member "Microsoft JhengHei" (font-family-list)) "Microsoft JhengHei")
    ((member "SimHei" (font-family-list)) "SimHei")))
  ((string-equal system-type "darwin")
   (cond
    ((member "Hei" (font-family-list)) "Hei")
    ((member "Heiti SC" (font-family-list)) "Heiti SC")
    ((member "Heiti TC" (font-family-list)) "Heiti TC")))
  ((string-equal system-type "gnu/linux")
   (cond
    ((member "WenQuanYi Micro Hei" (font-family-list)) "WenQuanYi Micro Hei")))))

(provide 'font-setup)

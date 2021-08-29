(require 'clojure-mode)
(require 'clj-refactor)
(require 'paredit)

(defadvice clojure-test-run-tests (before save-first activate)
  (save-buffer))

(defadvice nrepl-load-current-buffer (before save-first activate)
  (save-buffer))

(setq cljr-favor-private-functions nil)
(setq cljr-magic-require-namespaces
      '(("io"   . "clojure.java.io")
        ("set"  . "clojure.set")
        ("str"  . "clojure.string")
        ("walk" . "clojure.walk")
        ("zip"  . "clojure.zip")
        ("time" . "clj-time.core")
        ("log"  . "clojure.tools.logging")
        ("json" . "cheshire.core")))

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (cljr-add-keybindings-with-prefix "C-c RET"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

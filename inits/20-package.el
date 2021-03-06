(require 'package)
(add-to-list 'package-archives '("melpa" ."http://melpa.milkbox.net/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'cl)

(defvar installing-package-list
  '(
    ruby-mode
    php-mode
    scala-mode
    markdown-mode
    scss-mode
    haskell-mode
    google-c-style
    yaml-mode
    open-junk-file
    starter-kit
    starter-kit-lisp
    starter-kit-eshell 
    starter-kit-bindings
    clojure-mode 
    clojure-test-mode
    rainbow-delimiters
    ac-slime
    markdown-mode
    popup
    undo-tree
))


(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
              (package-install pkg))))

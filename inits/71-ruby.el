;; smart-compile
(require 'smart-compile)
(setq smart-compile-alist
      (append
       '(("\\.rb$" . "ruby %f"))
              smart-compile-alist))
(global-set-key (kbd "C-x c") 'smart-compile)
(global-set-key (kbd "C-x C-x") (kbd "C-x c C-m"))

;; xmpfilter
(require 'rcodetools)
(global-set-key (kbd "C-c C-d") 'xmp)

;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
;;(setq auto-mode-alist  (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")

(add-hook 'ruby-mode-hook
          '(lambda ()
             (turn-on-font-lock)
             (set-face-foreground font-lock-comment-face "pink")
             (set-face-foreground font-lock-string-face "yellow")
             (set-face-foreground font-lock-function-name-face "grey")
             (set-face-foreground font-lock-variable-name-face "orange")
             (set-face-foreground font-lock-keyword-face "LightSeaGreen")
             (set-face-foreground font-lock-type-face "LightSeaGreen")))

(global-font-lock-mode 1)
(setq default-frame-alist (append '(
                                    (foreground-color . "gray")  ;
                                    (background-color . "black") ;
                                    (cursor-color     . "blue")  ;
                                    ) default-frame-alist))

;; ruby-mode indent
(setq ruby-deep-indent-paren-style nil)

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; ミニバッファに表示し, かつ, オーバレイする.
(setq ruby-block-highlight-toggle t)

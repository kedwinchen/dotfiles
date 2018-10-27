;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun insert-date ()
  "insert the current date as Day Mon DD HH:MM:SS YYYY"
  (interactive)
  (insert (current-time-string))
)
;
;(global-set-key "\C-ct" 'insert-current-time)

(defun uncomment-region (beg end &optional arg)
   (interactive "*r\np")
   (comment-region beg end (- arg)))

(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-cv" 'visit-tags-table)
(global-set-key "\C-cl" 'line-number-mode)
(global-set-key "\C-ct" 'toggle-truncate-lines)
(global-set-key "\C-cc" 'column-number-mode)
(global-set-key "\C-\M-a" 'compile)
(global-set-key "\C-cd" 'ediff-directories)
(global-set-key "\C-cf" 'ediff-files)
(global-set-key "\C-cb" 'ediff-buffers)
(global-set-key "\C-o" 'other-window)
(global-set-key "\M-%" 'query-replace-regexp)
;; (global-set-key (kbd "<f9>") 'other-window)

;;(global-linum-mode t)
(setq large-file-warning-threshold nil)
(setq inhibit-default-init t)
(setq inhibit-eol-conversion t)
(setq inhibit-startup-message t)
;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)
(setq make-backup-files nil)
;;(setq default-major-mode 'text-mode)
(setq default-major-mode 'sql-mode)
(setq vc-make-backup-files nil)
;;(setq x-select-enable-clipboard t)
;;
;; Where to read tags
(setq tags-table-list 
	  '( "~" ))


(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'set-goal-column 'disabled t)

(setq search-delete-char ?\C-h)
(setq-default fill-column 128)
(setq-default case-fold-search t)   ; make searches case insensitive

; This is C style setting 
(setq c-auto-newline nil)
(setq c-tab-always-indent t)
(setq c-indent-level 4)
(setq c-brace-imaginary-offset 0)
(setq c-continued-statement-offset 2)
(setq c-brace-offset 0)
(setq c-argdecl-indent 5)
(setq c-label-offset -2)
(setq comment-multi-line t)
(setq comment-column 40)

(fset 'find-next-tag "\C-u\M-.")
(global-set-key "\M-," 'find-next-tag)
(global-set-key "\C-\M-f" 'tags-search)
(global-set-key "\C-\M-n" 'tags-loop-continue)

(setq help-char ?\C-^)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)
(global-set-key "\C-j" 'undo)
(global-set-key "\C-t" 'scroll-down)
(global-set-key "\C-xi" 'indent-region)
(global-set-key "\C-xw" 'what-line)
(global-set-key "\C-xl" 'goto-line)
;
;;  this is a modification for using one vt340
;(global-set-key "\C-x\C-k" 'save-buffer)
;
(define-key ctl-x-map "v" 'set-variable)
(define-key ctl-x-map "\C-^" 'special-symbol-input)
(define-key ctl-x-map "\C-n" 'rename-buffer) ; set-goal-column key replace
(define-key ctl-x-map "\C-v" 'set-visited-file-name)
(define-key ctl-x-map "\C-y" 'list-kill-ring-yank)
(define-key ctl-x-map "t" 'terminal-emulator)
(define-key ctl-x-4-map "o" 'occur)
(define-key help-map "y" 'list-kill-ring)
(define-key help-map "C" 'make-command-summary)
(define-key help-map "A" 'apropos)
(define-key help-map "K" 'list-kanji-codes)
(define-key help-map "u" 'unix-apropos)
(define-key help-map "U" 'manual-entry)

;;; (custom-set-variables
;;;   ;; custom-set-variables was added by Custom.
;;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;;   ;; Your init file should contain only one such instance.
;;;   ;; If there is more than one, they won't work right.
;;;  '(complex-buffers-menu-p t)
;;;  '(ediff-split-window-function (quote split-window-horizontally))
;;;  '(fast-lock-mode nil t (fast-lock))
;;;  '(font-lock-maximum-decoration t)
;;;  '(font-menu-ignore-scaled-fonts nil)
;;;  '(load-home-init-file t t)
;;;  '(paren-mode (quote sexp) nil (paren))
;;;  '(toolbar-visible-p nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fixed" :size "14pt"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face)) (((class color) (min-colors 8) (background light)) (:foreground "yellow"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "yellow"))))
 '(font-lock-function-name-face ((((class color) (min-colors 8)) (:foreground "white" :weight bold))))
 '(fringe ((((class color) (background light)) (:background "blue"))))
 '(lazy-highlight ((((class color) (min-colors 8)) (:background "blue"))))
 '(show-paren-match ((((class color) (background light)) (:background "blue")))))
;(setq ediff-current-diff-face-A 'bold-italic)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(show-paren-mode 1)
(setq show-paren-style `expression)
(setq default-tab-width 4)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(set-default-file-coding-system 'no-conversion-unix)
;;
(setq load-path (append (list (expand-file-name "~/.emacs.d/lisp")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ws$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.hop$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.lib$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.fun$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.c$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.C$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.H$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'smart-tabs-mode "smart-tabs-mode"
  "Intelligently indent with tabs, align with spaces!")
(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
(autoload 'smart-tabs-advice "smart-tabs-mode")
(autoload 'smart-tabs-insinuate "smart-tabs-mode")
(add-hook 'c++-mode-hook 'smart-tabs-mode-enable)
(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-xt" 'untabify)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp/emacs-textmate")
(require 'textmate)
(tm/initialize)
(global-set-key "\C-cp" 'tm/minor-mode)
(setq line-number-mode t)
(setq column-number-mode t)
(setq global-linum-mode t)
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


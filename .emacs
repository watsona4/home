(unless (featurep 'xemacs)

  (if (< emacs-major-version 23)
      (defun characterp (obj)
	(and (char-or-string-p obj) (not (stringp obj)))))

  (add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp"))
  (add-to-list 'load-path (expand-file-name "~/.emacs.d/themes"))

  (when (<= emacs-major-version 26)
    (require 'cl-lib)
    )

  (when (>= emacs-major-version 24)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
    (load-theme 'solarized-dark t)
    )

  (require 'whitespace)
  (setq whitespace-line-column 79)
  (setq whitespace-style '(spaces tabs newline space-mark tab-mark newline-mark face lines-tail))
  (setq whitespace-display-mappings
	'(
	  (space-mark nil)
	  (newline-mark nil)
	  (tab-mark 9 [183 9] [92 9])
	  ))
  (setq whitespace-global-modes '(not org-mode web-mode "Web" emacs-lisp-mode
				      fundamental-mode fundamental-ansi-mode
				      tex-mode))
  (global-whitespace-mode)

  (setq inhibit-startup-echo-area-message "watsam")
  (setq inhibit-startup-message t)

  (add-to-list 'default-frame-alist '(height . 45))
  (add-to-list 'default-frame-alist '(width . 80))

  (require 'time-stamp)
  (add-hook 'write-file-hooks 'time-stamp)

  (fset 'yes-or-no-p 'y-or-n-p)

  (if (or (eq system-type 'aix)
	  (eq system-type 'irix)
	  (eq system-type 'berkeley-unix))
      (normal-erase-is-backspace-mode))

  (global-set-key (kbd "C-c c") 'comment-region)
  (global-set-key (kbd "C-c u") 'uncomment-region)
  (global-set-key (kbd "C-c r") 'revert-buffer)
  (global-set-key (kbd "C-`") 'next-error)

  (global-set-key [(meta h)] 'view-order-manuals)

  (global-set-key [(meta g)] 'goto-line)

) ; End of my customizations
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(delete-selection-mode t nil (delsel))
 '(dired-recursive-deletes (quote always))
 '(fill-column 72)
 '(indent-tabs-mode nil)
 '(make-backup-files nil)
 '(mouse-wheel-mode t nil (mwheel))
 '(mouse-wheel-progressive-speed nil)
 '(require-final-newline t)
 '(scroll-bar-mode (quote right))
 '(show-paren-delay 0.5)
 '(show-paren-mode t nil (paren))
 '(show-paren-style (quote parenthesis))
 '(show-trailing-whitespace t)
 '(truncate-lines t)
 '(visible-bell t)
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "unknown" :slant normal
                        :weight normal :height 121 :width normal))))
 )

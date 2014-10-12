(require 'rcodetools)
(defun company-rcodetools (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (case command
    (interactive (company-begin-backend 'company-rcodetools))
    (prefix (and (rct-exec-and-eval rct-complete-command-name "--completion-emacs-icicles")
		 (company-grab-symbol)))
    (candidates (mapcar
		 (lambda (completion)
		   (replace-regexp-in-string "\t.*$" "" (car completion)))
		
		 rct-method-completion-table))
    (meta (format "This value is named %s" arg))))

(provide 'company-rcodetools)

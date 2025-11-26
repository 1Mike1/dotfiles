
(defun my/set-transparency ()
  "Set the transparency of the current frame."
  (set-frame-parameter (selected-frame) 'alpha '(90 . 90)))

;; Apply to all new frames
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (my/set-transparency))))

;; Apply to the initial frame as well
(add-hook 'emacs-startup-hook 'my/set-transparency)

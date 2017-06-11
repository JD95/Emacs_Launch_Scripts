;; Link to stack binaries
(setq windows-location "~/AppData/Roaming/local/bin")
(setq linux-location "")
(setq macos-location "~/.local/bin")
(setq stack-location (cond ((eq system-type 'windows-nt) windows-location)
			   ((eq system-type 'linux) linux-location)
			   (t macos-location)))

(let ((my-stack-path (expand-file-name stack-location)))
  (setenv "PATH" (concat my-stack-path path-separator (getenv "PATH")))
  (add-to-list 'exec-path my-stack-path))

;; Install Intero
(add-hook 'haskell-mode-hook 'intero-mode)

;; Haskell Style
(defun haskell-style ()
  "Sets the current buffer to use Haskell Style. Meant to be
  added to `haskell-mode-hook'"
  (interactive)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4))

(add-hook 'haskell-mode-hook 'haskell-style)

;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;; Drag line mode
(add-hook 'haskell-mode-hook 'drag-stuff-mode)

;; rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)


;;; flycheck-elixir-dogma.el --- Flycheck: Elixir linting support
;; Copyright (C) 2015 Graeme Coupar

;; Author: Graeme Coupar <grambo@grambo.me.uk>
;; Maintainer: Graeme Coupar <grambo@grambo.me.uk>
;; URL: http://github.com/obmarg/flycheck-elixir-dogma.el
;; Created: 30th November 2015
;; Version: 0.1
;; Keywords: tools
;; Package-Requires: ((flycheck "0.22"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Add Elixir linting support to Flycheck.
;;
;; Provide syntax & style checkers to check Elixir code using dogma
;;
;; This requires that `mix dogma` has been globally installed with mix archive.
;;
;; Installation:
;;
;; (eval-after-load 'flycheck '(flycheck-elixir-dogma-setup))

;;; Code:

(require 'flycheck)

(flycheck-define-checker elixir-dogma
  "Defines a checker for elixir with dogma"
  :command ("dogma" "--format=flycheck" source-inplace)
  :error-patterns
  ((info line-start (file-name) ":" line ":" column ": C: "
         (optional (id (one-or-more (not (any ":")))) ": ") (message) line-end)
   (warning line-start (file-name) ":" line ":" column ": W: "
            (optional (id (one-or-more (not (any ":")))) ": ") (message)
            line-end)
   (error line-start (file-name) ":" line ":" column ": " (or "E" "F") ": "
          (optional (id (one-or-more (not (any ":")))) ": ") (message)
          line-end))
  :modes (elixir-mode))

;;;###autoload
(defun flycheck-elixir-dogma-setup ()
  "Setup Flycheck for Elixir using dogma."
  (add-to-list 'flycheck-checkers 'elixir-dogma))

(provide 'flycheck-elixir-dogma)

;;; flycheck-elixir-dogma.el ends here

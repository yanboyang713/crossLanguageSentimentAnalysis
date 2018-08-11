(TeX-add-style-hook
 "paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("IEEEtran" "conference")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("biblatex" "style=authoryear-ibid" "backend=biber")))
   (TeX-run-style-hooks
    "latex2e"
    "IEEEtran"
    "IEEEtran10"
    "amsmath"
    "amssymb"
    "amsfonts"
    "algorithmic"
    "graphicx"
    "textcomp"
    "biblatex"
    "csquotes"
    "xcolor")
   (TeX-add-symbols
    "BibTeX")
   (LaTeX-add-labels
    "AA"
    "eq"
    "SCM"
    "tab1"
    "fig")
   (LaTeX-add-bibliographies
    "library"))
 :latex)


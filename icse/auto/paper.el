(TeX-add-style-hook
 "paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("IEEEtran" "conference")))
   (TeX-run-style-hooks
    "latex2e"
    "IEEEtran"
    "IEEEtran10"
    "cite"
    "amsmath"
    "amssymb"
    "amsfonts"
    "algorithmic"
    "graphicx"
    "textcomp"
    "xcolor"
    "CJKutf8")
   (TeX-add-symbols
    "BibTeX")
   (LaTeX-add-labels
    "itm:procedures"
    "currentQuantity"
    "fig:userRatingHistogram"
    "testingModle"
    "fig:testingProcedures"
    "itm:testingProcedure3"
    "fig:ROCandPRC"
    "accuracyJudgment")
   (LaTeX-add-bibliographies
    "library"))
 :latex)


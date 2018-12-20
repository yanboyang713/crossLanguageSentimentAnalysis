(TeX-add-style-hook
 "paper"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("IEEEtran" "conference" "compsoc")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("cite" "nocompress")))
   (TeX-run-style-hooks
    "latex2e"
    "IEEEtran"
    "IEEEtran10"
    "graphicx"
    "cite")
   (LaTeX-add-labels
    "sec:org0f265ba"
    "sec:orga60a215"
    "sec:org4c768b6"
    "sec:org56003d4"
    "sec:org20f5e88"
    "sec:org73e9c86"
    "sec:org938a23f")
   (LaTeX-add-bibitems
    "IEEEhowto:kopka"))
 :latex)


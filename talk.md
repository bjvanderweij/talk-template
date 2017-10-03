---
title:  'Promising Findings'
filter: pandoc-citeproc
bibliography: refs.bib
citation-style: apa.csl
date: August 12, 2049
header-includes:
    - \author[bvdw]{Jane Doe\inst{1}}
    - \institute[illc]{\inst{1} Institute for Very Important Questions, University of Alpha Centauri}
    - \beamertemplatenavigationsymbolsempty
    - \usepackage{tikz,xcolor,booktabs,subcaption,lilyglyphs,multirow,array,subcaption}
    - \usepackage[accent=blue]{include/beamercolorthemesolarized/beamercolorthemesolarized}
    - \input{include/macros}
...

# The first slide 

* Bullet one
* Bullet two

References @Doe1999, and also [@Doe1999;@Doe2000] [but cf. @Doe1999].

#

\includegraphics[height=0.3\textheight]{build/illustrations/svgdrawing}

\includegraphics[height=0.3\textheight]{build/illustrations/diagram}

# References

\tiny

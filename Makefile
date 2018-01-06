MAIN=thesis
RM=rm -f

.SUFFIXES: .tex

TEXFLAG+="$(MAIN).tex"

$(MAIN).pdf: *.tex style bib files figures tables
	xelatex -shell-escape $<; bibtex $(<:.tex=); xelatex -shell-escape $<; xelatex -shell-escape $(TEXFLAG)

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg *.out *.tdo *.fdb_latexmk *.fls *.xdv

clean-pdf: 
	$(RM) -f $(MAIN).pdf $(MAIN)-with-pass.pdf

clean-all: clean clean-pdf
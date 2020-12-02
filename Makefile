
COV = bookcover
DOC = document

all: ${COV}.pdf ${DOC}.pdf

bookcover.pdf: ${COV}.tex
	xelatex -shell-escape -synctex=1 -interaction=nonstopmode ${COV}
	rm -rf *.aux *.bbl *.log *.blg *.synctex.gz

document.pdf: ${DOC}.tex
	xelatex -shell-escape -synctex=1 -interaction=nonstopmode ${DOC}
	bibtex ${DOC}
	xelatex -shell-escape -synctex=1 -interaction=nonstopmode ${DOC}
	xelatex -shell-escape -synctex=1 -interaction=nonstopmode ${DOC}
	xelatex -shell-escape -synctex=1 -interaction=nonstopmode ${DOC}

clean:
	rm -rf ./_minted-document
	rm -rf *.out *.toc *.aux *.bbl *.log *.blg *.synctex.gz
	rm -rf body/*.out body/*.toc  body/*.aux body/*.bbl body/*.log body/*.blg body/*.synctex.gz

clean-pdf:
	rm -rf *.pdf

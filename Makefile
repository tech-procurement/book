.PHONY: serve pdf
serve:
		hugo server --minify

pdf:
		pandoc -s --pdf-engine=xelatex \
		-V papersize=a5 \
		-V documentclass=book \
		-V header-includes="\usepackage{merriweather}" \
		./content/chapters/*.md --out test.pdf
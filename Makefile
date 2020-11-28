.PHONY: serve pdf
serve:
		hugo server --minify

pdf:
		pandoc -s --pdf-engine=xelatex \
		--lua-filter=shortcodes.lua \
		-V papersize=a5 \
		-V documentclass=book \
		-V header-includes="\usepackage{merriweather}" \
 		-V header-includes="\usepackage{tcolorbox}" \
		-V header-includes="\newtcolorbox{myquote}{colback=red!5!white, colframe=red!75!black}" \
		-V header-includes="\renewenvironment{quote}{\begin{myquote}}{\end{myquote}}" \
		./content/chapters/*.md --out tech_procurement_book.pdf
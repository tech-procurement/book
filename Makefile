.PHONY: serve pdf
serve:
		hugo server --minify

pdf:
		pandoc -s --pdf-engine=xelatex \
		--lua-filter=shortcodes.lua \
		--template=./lib/book.latex \
		./metadata.txt ./content/chapters/*.md --out tech_procurement_book.pdf
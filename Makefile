DIR="docs"

all: gitbook pdf epub

gitbook:
	Rscript -e 'bookdown::render_book(".", "bookdown::gitbook", quiet=TRUE)'

pdf:
	bash _pandoc.sh tex latex
	Rscript -e 'bookdown::render_book(".", "bookdown::pdf_book", quiet=TRUE)'

epub:
	Rscript -e 'bookdown::render_book(".", "bookdown::epub_book", quiet=TRUE)'
	
serve:
	Rscript -e 'bookdown::serve_book(".", port = 5555)'

clean:
	rm -f Thesis*.* && rm -rf _bookdown_files

cleanall:
	make clean && rm -rf $(DIR)


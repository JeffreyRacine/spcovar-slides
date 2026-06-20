.DEFAULT_GOAL := short

.PHONY: short talk long open speaker clean

short:
	quarto render index.qmd --profile short

talk: short

long:
	quarto render index.qmd

open:
	open index.html

speaker:
	open index-speaker.html

clean:
	rm -rf index_files index_cache *~ *.bak

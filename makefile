.DEFAULT_GOAL := medium

.PHONY: short medium talk long open speaker clean

short:
	quarto render index.qmd --profile short

medium:
	quarto render index.qmd

talk: medium

long:
	quarto render index.qmd --profile long

open:
	open index.html

speaker:
	open index-speaker.html

clean:
	rm -rf index_files index_cache *~ *.bak

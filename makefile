talk:
	quarto render index.qmd

open:
	open index.html

speaker:
	open index-speaker.html

clean:
	rm -rf index_files index_cache *~ *.bak

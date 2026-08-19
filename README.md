# ISNPS 2026 Slides

Revealjs Quarto slides for the ISNPS 2026 talk based on
`/Users/jracine/Development/Rennes_2026/spcovar.qmd`.

This directory intentionally keeps only the minimal structure needed for the
talk:

- `index.qmd`: slide source;
- `custom.css`: style copied from the 2024 Braga revealjs deck;
- `figures/`: static PNG exports used by the CD4 application slides;
- `makefile`: render/open/clean helpers.

The bibliography is not copied. The slide source points directly to
`../references.bib`.

The same source provides three talk lengths:

- `make short`: compact conference talk;
- `make` or `make medium`: approximately 60-minute talk, adding the FDA
  background sequence to the short talk;
- `make long`: full extended talk.

Every render writes the canonical `index.html` and `index-speaker.html` files.

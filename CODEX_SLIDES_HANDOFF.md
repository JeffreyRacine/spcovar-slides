# Codex Handoff: spcovar Slide Deck

I want to continue developing the Quarto/revealjs slide deck for our paper on
semiparametric covariance estimation for sparse functional data.

## Project Locations

- Slide repository:
  `/Users/jracine/Development/Rennes_2026/slides_quarto`
- Primary slide source:
  `/Users/jracine/Development/Rennes_2026/slides_quarto/index.qmd`
- Manuscript source:
  `/Users/jracine/Development/Rennes_2026/spcovar.qmd`
- Shared bibliography:
  `/Users/jracine/Development/Rennes_2026/references.bib`
- Local R package:
  `/Users/jracine/Development/spcovar`
- Historical 2024 model deck:
  `/Users/jracine/Development/Rennes_2026/slides_quarto_braga/index.qmd`
- Published slides:
  <https://jeffreyracine.github.io/spcovar-slides>
- Prior Codex task containing the slide-development history:
  `019dd9d2-5362-7d30-b590-2739e7bc72eb`

The local manuscript and package source are authoritative. Do not assume the
public GitHub package is as current as the local package.

## Initial Read-Only Refresh

Before editing anything, read:

1. `/Users/jracine/Development/AGENTS.md`
2. `/Users/jracine/Development/Rennes_2026/slides_quarto/SKILLS.md`
3. `/Users/jracine/Development/Rennes_2026/slides_quarto/BUILD.md`
4. the YAML and relevant sections of `index.qmd`
5. the corresponding sections of `spcovar.qmd`
6. relevant package source and `.Rd` files when a slide describes
   implementation

Check the git status of the slide, manuscript, and package repositories.
Preserve every pre-existing change. Never stage `.DS_Store` files. Do not edit
the manuscript or package unless I explicitly request it.

Treat the live profile wrappers in `index.qmd` as authoritative for current
short/medium/long slide inclusion. Some prose in `SKILLS.md` or `BUILD.md` may
predate later slide-by-slide decisions.

Report the concise preflight state and then proceed with my slide request.

## Purpose and Audience

This is an academic presentation based on `spcovar.qmd`, not package
documentation. It should:

- explain enough functional data analysis background for a specialized
  audience that may not work routinely in FDA;
- emphasize motivation, estimator architecture, statistical interpretation,
  simulations, and the CD4 application;
- mention theoretical results without walking through proofs;
- present the methodological contribution independently of package
  implementation names;
- use the package only for reproducible examples, live demonstrations, and
  implementation details where appropriate.

The main scientific storyline is:

- sparse covariance estimation is difficult because a two-dimensional latent
  covariance surface must be recovered from sparse, irregular, noisy
  observations;
- covariance is decomposed into nonparametric marginal scale functions and a
  structured correlation surface;
- positive-definite parametric correlation families are fit and combined using
  data-driven model-averaging weights;
- cosine-series mean and variance estimation follows Efromovich;
- boundary correction avoids imposing zero endpoint derivatives, with the
  expected finite-sample bias-variance tradeoff;
- model averaging protects against relying on one fragile correlation family;
- simulations and the CD4 application provide the main empirical evidence.

Keep mathematical notation synchronized with the current manuscript,
especially the distinction between latent trajectories $X_i(t)$ and
observations $Y_{ij}$, and the definitions of $\mu(t)$, $\sigma^2(t)$,
$C(s,t)$, and $\rho(s,t)$.

The simulation evidence and comparison tables use MSE, not RMSE. Do not
reintroduce RMSE terminology unless the underlying quantity genuinely changes.

## Slide and Markup Rules

- Preserve the established Braga-derived revealjs style and `custom.css`.
- The deck is incremental. Bullets, nested bullets, equations, tables, and
  callouts must reveal in the intended top-to-bottom order.
- Use `$...$` and `$$...$$` for mathematics, consistently with the deck.
- Pay close attention to indentation: nested bullets use the existing
  four-space structure, and equations belonging to bullets must remain within
  the bullet.
- Avoid blank lines that cause display equations or fragments to escape their
  intended list item.
- Preserve the current callout-note structure for examples.
- Use speaker notes for definitions, acronyms, interpretation, and material to
  say aloud without cluttering the slide.
- Define acronyms before first use.
- Preserve the deck's established heading-capitalization convention.
- Keep slides concise enough for oral delivery.
- Do not add proofs line by line.
- Do not change slide inclusion globally when a slide-by-slide profile wrapper
  is appropriate.

For visual or fragment changes, inspect the rendered slide in the browser and
advance it point by point. A render completing successfully is necessary but
not sufficient: verify math, indentation, incremental order, overflow, tables,
figures, and notes.

## Short, Medium, and Long Formats

The same `index.qmd` produces all three talks:

- `make short` renders the compact conference talk;
- `make` or `make medium` renders the approximately 60-minute talk;
- `make long` renders the full extended talk.

All three commands overwrite the canonical:

- `index.html`
- `index-speaker.html`

Never create or publish `index-short.html` or `index-medium.html`. GitHub Pages
and multiplexing expect the canonical filenames.

Use complete-slide wrappers. To include a slide only in the long talk, use:

```markdown
::: {.content-visible when-profile="long"}
## Long-Talk Slide

Slide content.
:::
```

To use a compact replacement in both the short and medium talks, use:

```markdown
::: {.content-hidden when-profile="long"}
## Compact Slide

Slide content.
:::
```

To add a slide to medium and long while hiding it from short, use:

```markdown
::: {.content-hidden when-profile="short"}
## Medium-and-Long Slide

Slide content.
:::
```

During the current development session, additions are for medium unless Jeffrey
explicitly assigns them to short or long. When validating all versions, render
`make long`, then `make short`, then `make medium` so the canonical HTML left in
the repository is the medium deck.

## Reproducibility and Package Integration

- CD4 plots in the slides are generated from live R code using package
  defaults; do not substitute manuscript PNG files.
- Preserve the separate compact and long live-demo code:
  - short/medium version: semiparametric `spcovar` example without unused
    `crs`/`npcovar` material;
  - long version: may load `crs` and include the fully nonparametric `npcovar`
    comparison.
- Use the local `spcovar` package source and documentation to verify defaults
  and argument descriptions.
- Do not silently alter statistical definitions, simulation calculations,
  tuning descriptions, or package behavior to simplify a slide.
- If the manuscript, slides, and package disagree, identify the discrepancy
  before changing the scientific claim.
- Preserve caches and generated assets unless cleaning is explicitly
  requested.

## Git and Publishing Rules

- Do not commit or push unless I explicitly request it.
- Stage only files relevant to the requested slide change.
- Preserve unrelated modifications in all repositories.
- Before committing, render the requested profile and perform visual QA.
- Before pushing a published update, render all relevant formats,
  leave the intended published format rendered last, and verify that the GitHub
  Pages
  version matches the local canonical deck.
- Ensure all required generated figures and `index_files` assets are tracked so
  the published deck is complete.

At the time this handoff was prepared, the slide repository was on `main` at
commit `97ad651` (`Normalize slide heading capitalization`) with only an
untracked `.DS_Store`. Verify the current state rather than assuming that
checkpoint remains current.

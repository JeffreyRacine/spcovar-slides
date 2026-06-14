# SKILLS.md

## Purpose

This directory contains the Quarto/revealjs slide deck for Jeffrey S. Racine's
ISNPS 2026 talk on semiparametric covariance estimation for sparse functional
data.

The talk is scheduled for ISNPS 2026 in Thessaloniki, Greece, 22-26 June 2026.
The working slide source is:

- `/Users/jracine/Development/Rennes_2026/slides_quarto/index.qmd`

The primary manuscript source is:

- `/Users/jracine/Development/Rennes_2026/spcovar.qmd`

The bibliography should be referenced directly from:

- `/Users/jracine/Development/Rennes_2026/references.bib`

Do not copy the bibliography into this slide directory unless Jeffrey explicitly
asks for a self-contained archive.

## Provenance And Model Deck

The presentation style and talk structure are guided by the 2024 Braga revealjs
slides:

- `/Users/jracine/Development/Rennes_2026/slides_quarto_braga/index.qmd`

Those slides were based on the 2024 manuscript:

- `/Users/jracine/Downloads/manuscript-r0.pdf`

The key lesson from the 2024 talk is structural, not literal:

1. The talk does not proceed through proofs line by line.
2. It opens with audience-friendly background material.
3. It uses mathematical notation selectively to orient the audience.
4. It emphasizes intuition, estimator architecture, examples, simulations, and
   application evidence.
5. Proofs and technical lemmas are mentioned as results, not expanded in full.

The ISNPS 2026 deck should follow the same spirit.

## Current Talk Intention

The new talk is based on the current `spcovar.qmd` manuscript, whose proof
section is not yet complete. Proofs are expected to be added to the manuscript
later by the co-author, so the slides should not pretend to contain final
proof-level detail.

The talk should present the paper as a stand-alone methodological contribution
to sparse functional data covariance estimation, not as documentation for an R
package. Package implementation names should be avoided in the main narrative
unless Jeffrey explicitly asks for a software-focused slide.

The central storyline is:

1. Sparse FDA covariance estimation is hard because covariance is a two-
   dimensional object learned from noisy, irregular, sparse within-subject
   observations.
2. The proposed estimator decomposes covariance into nonparametric marginal
   scale functions and a semiparametric correlation surface.
3. Mean and variance estimation use cosine-series ideas in the spirit of
   Efromovich, with careful attention to boundary behavior.
4. Boundary correction is statistically honest: it avoids imposing zero
   derivative endpoint restrictions, even though it can increase finite-sample
   RMSE through the usual bias-variance tradeoff.
5. Correlation families provide interpretable positive-definite structure, and
   model averaging avoids brittle hard selection.
6. Simulations and the CD4 application should demonstrate practical behavior,
   not merely decorate the theory.

## Boundary-Correction Messaging

The boundary-correction discussion should be concise but honest.

Essential points:

- Uncorrected cosine expansions impose zero derivatives at the endpoints.
- This can be a valid prior restriction when endpoint slopes are truly zero.
- It can visibly distort estimates when endpoint slopes are not zero.
- Efromovich discusses polynomial correction as a remedy for boundary
  incompatibility.
- The Gram-Schmidt/QR construction restores orthonormality for a polynomial-
  augmented finite cosine span.
- Linear correction permits nonzero but common endpoint slopes.
- Quadratic correction permits independent nonzero endpoint slopes.
- The preferred default is defensible because it does not build in the zero-
  derivative restriction, not because it dominates all alternatives in RMSE.
- Applied users should be encouraged to conduct sensitivity analysis.

Use citations such as `[@efromovich1999]` and `[@bjorck2015]` where appropriate.

## Simulation Messaging

The current paper direction replaces earlier uniform-design, Neumann-endpoint
simulation settings with more challenging designs:

- beta-mixture observation times;
- non-Neumann mean and variance functions;
- semiparametric covariance estimation with boundary-corrected mean, variance,
  and nonparametric tensor stages where relevant;
- peer comparisons organized like the manuscript tables.

Slides should avoid overclaiming numerical results until the manuscript tables
are frozen. It is acceptable to use narrative slides and placeholders for
simulation table imports while the manuscript is still evolving.

When final tables are inserted, preserve the table organization used in
`spcovar.qmd` unless Jeffrey asks for a talk-specific simplification.

## CD4 Application Messaging

The CD4 application should be used as the concrete empirical anchor.

Important points:

- The data are sparse, irregular, and noisy.
- A simple parametric benchmark is feasible but imposes strong structure.
- The proposed estimator separates mean, marginal variance, measurement error,
  and correlation structure.
- Boundary behavior is visually consequential in this application.
- Sensitivity analysis across boundary choices is a virtue, not a weakness.

Static CD4 figure exports currently live in:

- `/Users/jracine/Development/Rennes_2026/slides_quarto/figures/cd4-location.png`
- `/Users/jracine/Development/Rennes_2026/slides_quarto/figures/cd4-covariance.png`

These were created from the manuscript-rendered figures and can be refreshed
when the manuscript figures change.

## Style Guidance

Follow the Braga revealjs style unless Jeffrey asks for a redesign:

- use the same general revealjs settings;
- keep `custom.css` light;
- keep slide text sparse enough for oral delivery;
- include speaker notes where they clarify intent;
- use backup slides for formula-heavy details;
- avoid turning the deck into a compressed manuscript.

The current directory should remain minimal. Do not migrate old Braga data,
scripts, caches, or generated artifacts unless they are truly needed.

## Working Rules

Before making substantial edits:

1. Read this file.
2. Check the current `spcovar.qmd` section being summarized.
3. Keep the deck aligned with the manuscript, but preserve talk pacing.
4. Render with `quarto render index.qmd` after edits.
5. Check that `index.html` and `index-speaker.html` are produced.

Do not mutate files outside `/Users/jracine/Development` unless Jeffrey
explicitly names the outside path and asks for that mutation in the current
turn.


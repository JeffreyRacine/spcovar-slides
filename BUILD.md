# Building The Slide Deck

This directory contains one Quarto/revealjs source deck, `index.qmd`, with two
intended render modes:

- full-length talk: about 1h20;
- short conference talk: about 25 minutes, plus the same backup slides.

The canonical published files are always:

- `index.html`
- `index-speaker.html`

Do not publish a differently named file such as `index-short.html`. GitHub Pages
and the revealjs multiplex/speaker setup expect the canonical names above.

## Full Talk

Render the full talk with the ordinary command:

```bash
quarto render index.qmd
```

This includes all main slides, backup slides, and references.

## Short Talk

Render the short conference talk with the `short` profile:

```bash
quarto render index.qmd --profile short
```

This still writes `index.html` and `index-speaker.html`, but hides selected
main-talk slides. Backup slides and references remain available.

## How Slides Are Included Or Removed

The full talk is the default. A slide appears in the full talk unless it is
deleted from `index.qmd`.

The short talk is controlled with Quarto conditional content blocks. To hide a
slide from the short talk while keeping it in the full talk, wrap that slide in:

```markdown
::: {.content-hidden when-profile="short"}
## Slide Title

Slide content.
:::
```

To keep a slide in both versions, leave it unwrapped.

To add a slide only to the short talk, use:

```markdown
::: {.content-visible when-profile="short"}
## Short-Talk Only Slide

Slide content.
:::
```

## Practical Editing Rules

- Keep backup slides outside the short-profile hiding blocks unless we
  intentionally want to remove them from the short version.
- Hide complete slides, not partial fragments, unless there is a strong reason
  to change only part of a slide.
- If a slide has tab panels or nested `###` headings, wrap the full `##` slide
  block so the tabset remains intact.
- After changing profile wrappers, render both versions once:

```bash
quarto render index.qmd
quarto render index.qmd --profile short
```

The second command determines what is currently in the canonical published
`index.html`.

## Current Short-Talk Intent

The short profile is intended to keep roughly one slide per minute for the
non-application material and about three minutes for the CD4 application. The
current short spine keeps:

- problem setup;
- covariance decomposition;
- mean/variance noise and boundary issue;
- boundary-corrected basis;
- correlation-family fitting and model averaging;
- implementation details;
- one main simulation table and one averaging-weight table;
- compact CD4 application slides;
- summary;
- all backup slides and references.

# Building The Slide Deck

This directory contains one Quarto/revealjs source deck, `index.qmd`, with three
intended render modes:

- short conference talk: the compact core;
- medium talk: the short core plus the FDA background sequence, intended for
  about 60 minutes of presentation time;
- long talk: the full extended deck.

The canonical published files are always:

- `index.html`
- `index-speaker.html`

Do not publish differently named files such as `index-short.html` or
`index-medium.html`. GitHub Pages and the revealjs multiplex/speaker setup
expect the canonical names above.

## Medium Talk (Default)

Render the medium talk with either:

```bash
make
# or
make medium
```

This is equivalent to the ordinary Quarto command:

```bash
quarto render index.qmd
```

The medium talk uses the compact short-talk spine and adds the FDA background
sequence from the expanded `Classical Versus Functional Data` slide through
`Replication`.

## Short Talk

Render the short conference talk with:

```bash
make short
```

This is equivalent to rendering the `short` profile explicitly:

```bash
quarto render index.qmd --profile short
```

## Long Talk

Render the full extended talk with:

```bash
make long
```

This is equivalent to rendering the `long` profile explicitly:

```bash
quarto render index.qmd --profile long
```

Every command writes `index.html` and `index-speaker.html`. The command run last
therefore determines the canonical local and published deck.

## How Slides Are Included Or Removed

The unprofiled source is the medium talk. The `short` and `long` profiles alter
that baseline.

To include a complete slide only in the long talk, use:

```markdown
::: {.content-visible when-profile="long"}
## Long-Talk Slide

Slide content.
:::
```

To use a compact slide in both short and medium while hiding it from long, use:

```markdown
::: {.content-hidden when-profile="long"}
## Compact Slide

Slide content.
:::
```

To include a complete slide in medium and long while hiding it from short, use:

```markdown
::: {.content-hidden when-profile="short"}
## Medium-and-Long Slide

Slide content.
:::
```

When short needs a replacement for a medium/long slide, pair the preceding
block with a complete-slide `.content-visible when-profile="short"` block.

## Practical Editing Rules

- Treat additions as medium by default during development for the upcoming
  60-minute talk unless Jeffrey assigns them explicitly to short or long.
- Hide complete slides, not partial fragments, unless there is a strong reason
  to change only part of a slide.
- If a slide has tab panels or nested `###` headings, wrap the full `##` slide
  block so the tabset remains intact.
- After changing profile wrappers, render all three versions once:

```bash
make long
make short
make medium
```

The final command leaves the medium deck in the canonical HTML files, as
required during the current medium-talk development session.

## Current Format Intent

The short profile is intended to keep roughly one slide per minute for the
non-application material and about three minutes for the CD4 application. Its
compact spine keeps:

- problem setup;
- covariance decomposition;
- mean/variance noise and boundary issue;
- boundary-corrected basis;
- correlation-family fitting and model averaging;
- implementation details;
- one main simulation table and one averaging-weight table;
- compact CD4 application slides;
- summary;
- references.

The medium talk keeps that same compact spine and adds the expanded FDA
background sequence. The long talk replaces compact variants with the existing
full-detail slides and includes every long-only section, including the backup
slides.

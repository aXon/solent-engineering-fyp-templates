# SEF639 Final Year Project – LaTeX templates

LaTeX templates for the three assessments of the final year project module
**SEF639** in the School of Technology and Maritime Industries at Southampton
Solent University, for students on:

- BEng (Hons) Electronic Engineering
- BEng (Hons) Electronic Engineering (Apprenticeship)
- BEng (Hons) Mechanical Engineering
- BEng (Hons) Renewable Energy Engineering

The templates follow the structure and rules of the **SEF639 Project
Handbook**. Where this README and the Handbook or an assessment brief
disagree, the Handbook and the brief apply. Using LaTeX is optional; work
written in Word or PowerPoint is assessed in exactly the same way.

| Folder | Assessment | Length |
|---|---|---|
| [`progress-report/`](progress-report/) | AE1 Progress Report (20%) | 2,000 words maximum |
| [`final-report/`](final-report/) | AE2 Final Report (70%) | 10,000 words ±10% |
| [`poster/`](poster/) | AE3 Engineering Project Day poster (10%) | A2, landscape or portrait |

All three share the same look, referencing style and building blocks, so
that tables, figures and text can move from the Progress Report into the
Final Report and onto the poster.

## Getting started

### Overleaf (recommended if you are new to LaTeX)

1. Download the zip file of the template you need (for example
   `final-report-template.zip`) from the latest [release](../../releases).
2. In Overleaf: **New Project → Upload Project** and select the zip file.
3. **Menu → Settings → Compiler: LuaLaTeX.** The templates do not work with
   pdfLaTeX or XeLaTeX.
4. Open `main.tex`, enter your details in section 2 and recompile.

### On your own computer

Install a TeX distribution (TeX Live, MiKTeX or MacTeX), then in the
template folder run

```bash
latexmk                                        # draft
latexmk -usepretex='\def\reportmode{final}'    # final version for submission
```

The `latexmkrc` file runs LuaLaTeX, Biber and makeglossaries for you.
Editors such as TeXstudio, VS Code (LaTeX Workshop) or TeXShop can use it
too.

### Logo

The Southampton Solent University logo is **not** included in this
repository. Download it from the **SEF639 module page on SOL** and save it
as `figures/solent-logo.pdf` (or `.png`) in the template folder. Until then
the title page and the poster show a placeholder.

## Settings at the top of `main.tex`

| Setting | Values | Effect |
|---|---|---|
| `\reportmode` | `draft`, `final` | Draft shows guidance boxes, `\todo{}` notes, a DRAFT watermark and the word count. Final removes all of these – use it for submission. |
| `\fontstyle` | `brand`, `classic` | `brand`: Carlito, a free font with the same metrics as Calibri, the system font of the university brand guidelines. `classic`: Latin Modern, the traditional LaTeX look. |
| `\course{…}` | four lines | Keep exactly one of the course lines active. |
| `\posterorientation` | `landscape`, `portrait` | Poster only. |

## What the templates do for you

- **Structure from the Handbook.** Final Report: title page (Appendix E),
  acknowledgements, AI use declaration, abstract, CONTENTS, FIGURES,
  TABLES, NOTATION, eleven main-body chapters, references, bibliography and
  appendices (Appendix A). Progress Report: the nine sections listed for
  the Progress Report in Phase Two. Poster: the required content of the
  Poster Presentation section, including the brief AI statement.
- **Page numbering:** roman before the main body, arabic from page 1,
  bottom centre.
- **Harvard Solent referencing** with Biber, in the same configuration as
  the Handbook. Cited sources go into *References*; sources added with
  `\nocite{key}` go into *Bibliography*.
- **Word count while the document is typeset.** Reports: body text,
  headings and list items of the main body; captions, tables, footnotes,
  equations, guidance boxes, front matter, references and appendices are not
  counted. The count appears in the log, in the draft header and in a
  word-count report at the end, with a warning when the Final Report is more
  than 10% away from 10,000 words or the Progress Report is over 2,000.
  Poster: all panel text, with a recommendation of up to 800 words.
- **Brand guidelines** (Southampton Solent University, v2.0, 2024): Solent
  Red and white as lead colours, Navy for text, the brand palette and only
  the permitted tints, logo top left on the poster.
- **Building blocks**, shown in the example text:
  - numbered objectives `O1, O2 …` (`objectives` list);
  - numbered requirements `R1, R2 …` (`\req{req:label}`) that can be
    referenced in the decision matrix, the tests and the evaluation;
  - a weighted decision matrix that adds up the scores (`\weight`,
    `\score`, `\scoretotal`) and checks that the weights add up to 1;
  - a risk register with coloured ratings (`\riskrating{L}{S}`);
  - a Gantt chart with planned and actual progress (pgfgantt);
  - flowchart styles for the methodology (`fyp process`, `fyp decision` …);
  - plots straight from CSV data (pgfplots), code listings, SI units
    (siunitx), abbreviations and symbols (glossaries);
  - automatic inclusion of the ethics release, DSE and GRA01 PDFs from
    `evidence/`;
  - on the poster: a QR code (for example to a demonstration video) and a
    warning when a column is too full.
- `README-evidence.md`: a template for the README of the digital evidence
  submission of the Final Report.

## Folder structure

```
final-report/                progress-report/          poster/
├── main.tex                 ├── main.tex              ├── main.tex
├── references.bib           ├── references.bib        ├── references.bib
├── chapters/                ├── sections/             ├── panels/
├── frontmatter/             ├── frontmatter/          ├── figures/
├── appendices/              ├── appendices/           ├── data/
├── figures/  data/          ├── figures/  data/       ├── setup/
├── evidence/                ├── evidence/             └── latexmkrc
├── setup/                   ├── setup/
└── latexmkrc                └── latexmkrc
shared/setup/                master copy of the shared code
tools/sync-shared.sh         copies shared/setup into every template
```

`setup/` contains the template code; students normally do not need to
change it.

## Maintaining the templates

The code shared by all templates (`fyp-common.tex`, `wordcount.lua`) is
kept once in `shared/setup/`. After changing it, run
`tools/sync-shared.sh` and commit the copies. The GitHub Action fails if a
template's copy differs from the master, builds all templates in draft and
final mode, and attaches the PDFs and the Overleaf zip files to a release
when a tag `v…` is pushed.

## Questions and problems

Questions about the content of your work go to your supervisor. Problems
with the templates themselves can be reported as an [issue](../../issues)
on GitHub.

## Licence

The templates are released under the [MIT Licence](LICENSE). You do not
need to credit the templates in your work.

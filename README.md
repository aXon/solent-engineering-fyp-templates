# SEF639 Final Year Project – LaTeX templates

LaTeX templates for the final year project module **SEF639** in the School of
Technology and Maritime Industries at Solent University, for students on:

- BEng (Hons) Electronic Engineering
- BEng (Hons) Electronic Engineering (Apprenticeship)
- BEng (Hons) Mechanical Engineering
- BEng (Hons) Renewable Energy Engineering

The templates follow the structure and rules of the **SEF639 Project
Handbook**. Where this README and the Handbook or an assessment brief
disagree, the Handbook and the brief apply. Using LaTeX is optional; a report
written in Word is assessed in exactly the same way.

| Folder | Assessment | Status |
|---|---|---|
| [`final-report/`](final-report/) | AE2 Final Report (70%, 10,000 words) | available |
| `progress-report/` | AE1 Progress Report (20%, 2,000 words) | planned |
| `poster/` | AE3 Engineering Project Day poster (A2) | planned |

## Getting started

### Overleaf (recommended if you are new to LaTeX)

1. Download `final-report-template.zip` from the latest
   [release](../../releases), or download this repository and zip the
   `final-report` folder.
2. In Overleaf: **New Project → Upload Project** and select the zip file.
3. **Menu → Settings → Compiler: LuaLaTeX.** (The template does not work
   with pdfLaTeX or XeLaTeX.)
4. Open `main.tex`, enter your details in section 2 and recompile.

### On your own computer

Install a TeX distribution (TeX Live, MiKTeX or MacTeX), then in the
`final-report` folder run

```bash
latexmk                                        # draft
latexmk -usepretex='\def\reportmode{final}'    # final version for submission
```

The `latexmkrc` file runs LuaLaTeX, Biber and makeglossaries for you. Editors
such as TeXstudio, VS Code (LaTeX Workshop) or TeXShop can use it too.

### Logo

The Solent University logo is **not** included in this repository. Download
it from the **SEF639 module page on SOL** and save it as
`final-report/figures/solent-logo.pdf` (or `.png`). Until then the title page
shows a placeholder and the university name in text.

## What the template does for you

- **Structure from the Handbook (Appendix A):** title page (Appendix E),
  acknowledgements, AI use declaration, abstract, CONTENTS, FIGURES, TABLES,
  NOTATION, the eleven main-body chapters, references, bibliography and
  appendices.
- **Page numbering:** roman numerals before the introduction, arabic from
  page 1 of the introduction, bottom centre.
- **Harvard Solent referencing** with Biber, in the same configuration as the
  Handbook. Cited sources go into *References*; sources added with
  `\nocite{key}` go into *Bibliography*.
- **Draft and final mode** (set `\reportmode` at the top of `main.tex`).
  Draft mode shows guidance boxes in every chapter, `\todo{}` notes, a DRAFT
  watermark, a header stamp and a word-count report at the end. Final mode
  removes all of these – you do not have to delete anything before you
  submit, but you should of course replace the example text.
- **Word count of the main body** while the document is typeset: body text,
  headings and list items from the introduction to the recommendations.
  Captions, tables, footnotes, equations, guidance boxes, front matter,
  references and appendices are not counted. The count appears in the log, in
  the draft header and in the word-count report, and you get a warning when
  you are more than 10% away from the target.
- **Building blocks** used in the example chapters:
  - numbered objectives `O1, O2 …` (`objectives` list) for the introduction
    and the conclusions;
  - numbered requirements `R1, R2 …` (`\req{req:label}`) that can be
    referenced in tests, decision matrix and evaluation;
  - a weighted decision matrix that adds up the scores (`\weight`, `\score`,
    `\scoretotal`);
  - a risk register with coloured ratings (`\riskrating{L}{S}`);
  - a Gantt chart with planned and actual progress (pgfgantt);
  - flowchart styles for the methodology (`fyp process`, `fyp decision` …);
  - plots straight from CSV data (pgfplots), code listings, SI units
    (siunitx), abbreviations and symbols (glossaries);
  - automatic inclusion of the ethics release, DSE and GRA01 PDFs from
    `evidence/`.
- `README-evidence.md`: a template for the README of the digital evidence
  submission.

## Folder structure (final report)

```
final-report/
├── main.tex                 your details and the list of chapters
├── references.bib           your references
├── chapters/                one file per chapter
├── frontmatter/             title page, AI declaration, abstract, notation
├── appendices/
├── figures/                 images (and the logo)
├── data/                    CSV data for plots
├── evidence/                ethics release, DSE, GRA01, Gantt as PDF
├── setup/                   template code – normally no need to edit
└── latexmkrc
```

## Questions and problems

Questions about the content of your report go to your supervisor. Problems
with the template itself can be reported as an
[issue](../../issues) on GitHub.

## Licence

The template is released under the [MIT Licence](LICENSE). You do not need
to credit the template in your report.

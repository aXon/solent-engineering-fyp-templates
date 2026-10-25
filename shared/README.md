# Shared template code

`setup/` holds the code that all templates share. These files are the
**master copies**:

| File | Content | Used by |
|---|---|---|
| `fyp-brand.tex` | fonts (Carlito/Latin Modern) and brand colours | templates, Handbook |
| `fyp-harvard.tex` | Harvard Solent referencing (biblatex, Biber) | templates, Handbook |
| `fyp-gantt.tex` | Gantt chart style (`fyp`, `fyp actual`, `\fypsemesters`) | templates, Handbook |
| `fyp-common.tex` | everything else for the templates; loads the three above | templates |
| `wordcount.lua` | word count of the main body | templates |

After editing them, run

```bash
tools/sync-shared.sh
```

to copy them into each template's `setup/` folder, so that every template
stays self-contained (for Overleaf). Template-specific settings (main-body
unit, word limit) live in each template's `setup/layout.tex`.

The SEF639 Project Handbook (separate, private repository) uses
`fyp-brand.tex`, `fyp-harvard.tex` and `fyp-gantt.tex` from a tagged
release of this repository.

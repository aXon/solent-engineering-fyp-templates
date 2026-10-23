# Shared template code

`setup/` holds the code that all templates share: packages, Harvard Solent
referencing, colours, word count, guidance boxes and building blocks.

These files are the **master copies**. After editing them, run

```bash
tools/sync-shared.sh
```

to copy them into each template's `setup/` folder, so that every template
stays self-contained (for Overleaf). Template-specific settings (main-body
unit, title page, word limit) live in each template's `setup/layout.tex`.

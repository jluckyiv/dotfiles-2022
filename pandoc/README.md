# Pandoc

This file is a reference for the pandoc command-line tool.
`dotfiles/pandoc/.local/share/pandoc/reference.docx`

This file creates a filter that will populate the document with metadata.

`dotfiles/pandoc/.local/share/pandoc/filters/meta-vars.lua`

<https://pandoc.org/lua-filters.html#replacing-placeholders-with-their-metadata-value>

Given `input.md`:

```markdown
---
name: Samuel Q. Smith
occupation: Professor of Phrenology
---

Name

:   %name%

Occupation

:   %occupation%
```

The command `pandoc -o output.docx --lua-filter=meta-vars.lua input.md` will
populate the fields with the metadata values.

Given `input.md`:

```markdown

Name

:   %name%

Occupation

:   %occupation%
```

with `meta.yaml`:
  
```yaml
name: Samuel Q. Smith
occupation: Professor of Phrenology
```

The command `pandoc -o output.docx --metadata-file=meta.yaml --lua-filter=meta-vars.lua input.md`
will populate the fields with the metadata values.

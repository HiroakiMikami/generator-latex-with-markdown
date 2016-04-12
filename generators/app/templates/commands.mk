# shell command used to compile a LaTeX document
## latex
latex = <%= latexEngine %>
latexFlags = --interaction=nonstopmode --kanji=utf8

bb=extractbb

## markdown
pandoc = pandoc
pandocFlags = -t latex

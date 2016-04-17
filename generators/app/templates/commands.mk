# shell command used to compile a LaTeX document
## latex
latex = <%= latexEngine %>
latexFlags = --interaction=nonstopmode --kanji=utf8

bibtex=pbibtex
bibtexFlags = --kanji=utf8

bb=extractbb

## markdown
pandoc = pandoc
pandocFlags = -t latex

## inkscape
inkscape = inkscape

## graphviz
dot = dot
dotFlags = -Tsvg:cairo:cairo

## phantomjs
phantomjs = ./node_modules/phantomjs/bin/phantomjs

## pdfcrop
pdfcrop=pdfcrop

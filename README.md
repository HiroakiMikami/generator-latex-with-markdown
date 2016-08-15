# generator-latex-with-markdown
<!--
[![NPM version][npm-image]][npm-url]
[![Build Status][travis-image]][travis-url]
[![Dependency Status][daviddm-image]][daviddm-url]
-->
> Yeoman generator for LaTeX documents

## Features
1. Can combine LaTeX and markdown
2. Can deal with `html`, `svg`, and `dot`(graphviz) files via PDF files
3. Can see the difference between two Git commits

## Usage of a Created Project
### Structure
The structure of the project as follows:

```
+--- [ProjectName].pdf          # Generated PDF document
+--- [ProjectName]-draft.pdf    # Generated PDF document (show linenumber)
+--- [ProjectName]-no-image.pdf # Generated PDF document (show linenumber and use draftmode)
+--- diff.pdf                   # Difference between two Git commits
+--- parameters.mk              # Definition of the parameters
+--- commands.mk                # Commands and options used to compile
+--- src/
|     +--- preamble.tex         # The tex file containing the preamble
|     +--- document.tex         # The tex file containing the document
|     +--- documentclass.json   # The information about documentclass
|     +--- doc/
|     |     +--- foo.tex        # Tex file used in main.tex
|     |     +--- bar.md         # Markdown file can be used
|     +--- image/
|     |     +--- image1.png
|     |     +--- image2.jpg
|     |     +--- image3.pdf
|     |     +--- image4.svg     # svg files are converted to PDF files
|     +--- graphviz
|     |     +--- graph.dot      # The graphviz file
|     +--- html
|     |     +--- image.html     # The html file that is converted to pdf file
|     +--- bib
|           +--- ref.bib        # The reference file
+--- generated/
+--- scripts/
+--- makefile.d/
+--- Makefile
```

All files you write to make a document are contained in `src` directory. The final outcomes (pdf files) are shown in the root directory.

### Compile a Document
To build a document, run:
```bash
make # or make document or make all
```

#### Using Draft Mode
To build a document in draft mode, run:
```bash
make draft
```

### Show a Difference of two Git commits
```bash
./pdf-diff.sh <old-commit> <new-commit>
evince diff.pdf
```

> **Note:**
> I think there are no bugs, but I recommend to run `git commit` before running `pdf-diff.sh`. `pdf-diff.sh` operates the revision graph of Git, so changes that are not committed may be erased.

### Build automatically
To build a document automatically, run:
```bash
./amake
```

If you want to use the draft mode, run:
```bash
./amake draft
```

## Generator Usage
### 1. Install [Yeoman](http://yeoman.io) and this generator
Install [Yeoman](http://yeoman.io) and generator-latex-with-markdown using [npm](https://www.npmjs.com/) (we assume you have pre-installed [node.js](https://nodejs.org/)).

```bash
# 'sudo' may be required in some environments.
npm install -g yo
npm install -g generator-latex-with-markdown
```

### 2. Install the Depended Tools
Install the following tools:

* [inkscape](https://inkscape.org)
* [dot(Graphviz)](http://www.graphviz.org/)
* [pandoc](http://pandoc.org/)
* [pdfcrop](http://pdfcrop.sourceforge.net/)
* [latexdiff](https://www.ctan.org/tex-archive/support/latexdiff)
* [git](https://git-scm.com/)

The generator occurs an error if the depended tools are not installed.

### 3. Generate Your New Project
```bash
yo latex-with-markdown
```

## Environment

I tested this generator only in Linux, but I think that it works in OS X.

## Getting To Know Yeoman

 * Yeoman has a heart of gold.
 * Yeoman is a person with feelings and opinions, but is very easy to work with.
 * Yeoman can be too opinionated at times but is easily convinced not to be.
 * Feel free to [learn more about Yeoman](http://yeoman.io/).

## License

MIT © [Mikami Hiroaki]()

<!--

[npm-image]: https://badge.fury.io/js/generator-latex-with-markdown.svg
[npm-url]: https://npmjs.org/package/generator-latex-with-markdown
[travis-image]: https://travis-ci.org/hiroakimikami/generator-latex-with-markdown.svg?branch=master
[travis-url]: https://travis-ci.org/hiroakimikami/generator-latex-with-markdown
[daviddm-image]: https://david-dm.org/hiroakimikami/generator-latex-with-markdown.svg?theme=shields.io
[daviddm-url]: https://david-dm.org/hiroakimikami/generator-latex-with-markdown
-->

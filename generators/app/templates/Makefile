# Constants
mainTexName=main
preambleTexName=preamble
documentTexName=document
documentClassJsonName=documentclass

# Directories
root=.
script=$(root)/scripts
prefix=$(root)/prefix
## Sources
src=$(root)/src
doc=$(src)/doc
image=$(src)/image
graphviz=$(src)/graphviz
html=$(src)/html
bib=$(src)/bib
## Generated
generated=$(root)/generated
generatedDoc=$(generated)/doc
generatedImage=$(generated)/image
generatedGraphviz=$(generated)/graphviz
generatedHtml=$(generated)/html
generatedBib=$(generated)/bib

# Files
## Destination
destinationFile=$(root)/$(documentName).pdf
destinationDraftFile=$(root)/$(documentName)-draft.pdf
destinationWithoutImageFile=$(root)/$(documentName)-no-image.pdf
## Sources
documentClassJsonFile=$(src)/$(documentClassJsonName).json
texFiles=$(shell find $(doc) -name "*.tex") $(src)/$(preambleTexName).tex $(src)/$(documentTexName).tex
markdownFiles=$(shell find $(doc) -name "*.md")
pngFiles=$(shell find $(image) -name "*.png")
jpgFiles=$(shell find $(image) -name "*.jpg")
pdfFiles=$(shell find $(image) -name "*.pdf")
svgFiles=$(shell find $(image) -name "*.svg")
imageFiles=$(pngFiles) $(jpgFiles) $(pdfFiles)
dotFiles=$(shell find $(graphviz) -name "*.dot")
htmlFiles=$(shell find $(html) -name "*.html")
bibFiles=$(shell find $(bib) -name "*.bib")
## Generated
generatedMainTexFile=$(generated)/$(mainTexName).tex
generatedMainDocumentTexFile=$(generated)/$(mainTexName)-document.tex
generatedMainDraftTexFile=$(generated)/$(mainTexName)-draft.tex
generatedMainWithoutImageTexFile=$(generated)/$(mainTexName)-no-image.tex
generatedTexFiles=$(texFiles:$(src)/%=$(generated)/%) $(markdownFiles:$(doc)/%.md=$(generatedDoc)/%.tex)
generatedImageFiles=$(imageFiles:$(image)/%=$(generatedImage)/%) $(svgFiles:$(image)/%.svg=$(generatedImage)/%.pdf)
generatedDotFiles=$(dotFiles:$(graphviz)/%.dot=$(generatedGraphviz)/%.pdf)
generatedHtmlFiles=$(htmlFiles:$(html)/%.html=$(generatedHtml)/%.pdf)
generatedBibFiles=$(bibFiles:$(bib)/%.bib=$(generatedBib)/%.bib)
### All generated files
generatedFiles=$(generatedTexFiles) $(generatedImageFiles) $(generatedDotFiles) $(generatedHtmlFiles) $(generatedBibFiles)

# Parameters and Settings
include parameters.mk
include commands.mk

## Required by Tex
ifeq ($(latex),pdflatex)
else
ifeq ($(latex),pdftex)
else
	# xbb files are required when the LaTeX engine is neither pdflatex nor pdftex.
boundingBoxes=$(addsuffix .xbb, $(basename $(generatedImageFiles) $(generatedDotFiles) $(generatedHtmlFiles)))
endif
endif

.PHONY: all document draft assemble clean
.PRECIOUS: $(generatedFiles)

all: document

document: $(destinationFile)
$(destinationFile): $(generated)/$(mainTexName)-document.pdf
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi

draft: $(destinationDraftFile)
$(destinationDraftFile): $(generated)/$(mainTexName)-draft.pdf
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi

no-image: $(destinationWithoutImageFile)
$(destinationWithoutImageFile): $(generated)/$(mainTexName)-no-image.pdf
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi


$(generatedMainDocumentTexFile): $(generatedMainTexFile)
	cat $(prefix)/document-prefix.tex $< > $@

$(generatedMainDraftTexFile): $(generatedMainTexFile)
	cat $(prefix)/draft-prefix.tex $< > $@

$(generatedMainWithoutImageTexFile): $(generatedMainTexFile)
	cat $(prefix)/no-image-prefix.tex $< > $@

assemble: $(generated)/$(mainTexName)-assemble.tex
$(generated)/$(mainTexName)-assemble.tex: $(generatedMainDocumentTexFile) $(generatedTexFiles)
	node $(script)/assemble.js $(generated) $(generatedMainDocumentTexFile) > $(generated)/$(mainTexName)-assemble.tex

clean:
	rm -rf $(generated)/*

# Make rules
include makefile.d/maintex.mk
include makefile.d/outcome.mk
include makefile.d/markdown.mk
include makefile.d/svg.mk
include makefile.d/graphviz.mk
include makefile.d/html.mk
include makefile.d/symlink.mk

%.xbb: %.pdf
		$(bb) $<
%.xbb: %.jpg
		$(bb) $<
%.xbb: %.png
		$(bb) $<
%.xbb: %.jpg
		$(bb) $<

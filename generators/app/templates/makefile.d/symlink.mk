# Generate symlinks to the generated directory
## Tex files
$(generated)/%.tex: $(src)/%.tex
	mkdir -p $(generated)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi
$(generatedDoc)/%.tex: $(doc)/%.tex
	mkdir -p $(generatedDoc)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi

## Image files
$(generatedImage)/%.png: $(image)/%.png
	mkdir -p $(generatedImage)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi
$(generatedImage)/%.jpg: $(image)/%.jpg
	mkdir -p $(generatedImage)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi
$(generatedImage)/%.pdf: $(image)/%.pdf
	mkdir -p $(generatedImage)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi

## BibTex files
$(generatedBib)/%.bib: $(bib)/%.bib
	mkdir -p $(generatedBib)
	if [ -z "$(realpath $@)" ]; then \
		ln -s $(abspath $<) $@; \
	fi

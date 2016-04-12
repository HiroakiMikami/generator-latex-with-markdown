# Generate symlinks to the generated directory
## Tex files
$(generatedMainTexFile): $(mainTexFile)
	mkdir -p $(generated)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi
$(generatedDoc)/%.tex: $(doc)/%.tex
	mkdir -p $(generatedDoc)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi

## Image files
$(generatedImage)/%.png: $(image)/%.png
	mkdir -p $(generatedImage)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi
$(generatedImage)/%.jpg: $(image)/%.jpg
	mkdir -p $(generatedImage)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi
$(generatedImage)/%.pdf: $(image)/%.pdf
	mkdir -p $(generatedImage)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi

## BibTex files
$(generatedBib)/%.bib: $(bib)/%.bib
	mkdir -p $(generatedBib)
	if [ ! -n "`find $@ -maxdepth 0 -type l 2> /dev/null`" ]; then \
	  ln -s `realpath $< --relative-to=$(shell dirname $@)` $@; \
	fi

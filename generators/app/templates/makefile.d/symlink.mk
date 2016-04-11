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

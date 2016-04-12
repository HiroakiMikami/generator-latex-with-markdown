$(generatedDoc)/%.tex: $(doc)/%.md
	mkdir -p $(generatedDoc)
	$(pandoc) $< $(pandocFlags) > $@

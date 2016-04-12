$(generatedDoc)/%.tex: $(doc)/%.md
	$(pandoc) $< $(pandocFlags) > $@

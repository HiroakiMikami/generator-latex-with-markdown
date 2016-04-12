# svg files
$(generatedImage)/%.pdf: $(image)/%.svg
	$(inkscape) $< -A $@

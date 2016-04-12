# svg files
$(generatedImage)/%.pdf: $(image)/%.svg
	mkdir -p $(generatedImage)
	$(inkscape) $< -A $@

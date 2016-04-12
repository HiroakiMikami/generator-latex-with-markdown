$(generatedGraphviz)/%.pdf: $(graphviz)/%.dot
	mkdir -p $(generatedGraphviz)
	$(script)/dot2pdf.sh $(inkscape) $(dot) $< $@ $(dotFlags)

$(generatedHtml)/%.pdf: $(html)/%.html
	mkdir -p $(generatedHtml)
	$(phantomjs) $(script)/html2pdf.js $< $@ $(htmlWidth) $(htmlHeight)
	$(pdfcrop) $@ $@

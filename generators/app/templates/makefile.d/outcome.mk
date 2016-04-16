$(generated)/%.pdf: $(generated)/%.tex $(generatedFiles) $(boundingBoxes)
	# Generate aux file
	cd $(generated) && \
	$(latex) $(basename $(notdir $@)) $(latexFlags)
	cd $(generated) && \
	$(bibtex) $(bibtexFlags) $(basename $(notdir $@)) || echo
	# Generate PDF file
	cd $(generated) && \
	../$(script)/tex2pdf.sh $(latex) $(basename $(notdir $@)) $(latexFlags)

$(generatedMainTexFile): $(documentClassJsonFile)
	mkdir -p $(generated)
	$(script)/mk-maintex.js $< $(mainTexName) $(preambleTexName) $(documentTexName) $@

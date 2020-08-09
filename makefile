TEXHOME := $(shell kpsewhich -var-value=TEXMFHOME)

.PHONY: install
install:
	mkdir -p ${TEXHOME}/tex/latex/csvtabular/
	cp src/* ${TEXHOME}/tex/latex/csvtabular/

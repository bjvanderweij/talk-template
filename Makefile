BUILDDIR=build/
INCLUDEDIR=include/
TEMPLATEDIR=pandoc-templates/
ILLUSTRATIONSDIR=illustrations/
PANDOC_OPTS=--filter pandoc-citeproc -fmarkdown-all_symbols_escapable -t beamer --template $(TEMPLATEDIR)default.beamer

# List files to be made by finding all *.md files and appending .pdf
PDFS := $(patsubst %.md,$(BUILDDIR)pdf/%.pdf,$(wildcard *.md))
# List eps files to be made from DIA files
DIAGRAMS := $(patsubst $(ILLUSTRATIONSDIR)%.dia,$(BUILDDIR)illustrations/%.eps,$(wildcard $(ILLUSTRATIONSDIR)*.dia))
# List of eps files to be made from svg files
SVGILLUSTRATIONS := $(patsubst $(ILLUSTRATIONSDIR)%.svg,$(BUILDDIR)illustrations/%.eps,$(wildcard $(ILLUSTRATIONSDIR)*.svg))

# The all rule makes all the PDF files listed
all : $(PDFS)

pdf : $(PDFS)

illustrations : $(SVGILLUSTRATIONS) $(DIAGRAMS)

directories : build/illustrations build/tex build/pdf
	mkdir -p build/illustrations build/tex build/pdf

$(BUILDDIR)illustrations/%.eps : $(ILLUSTRATIONSDIR)%.dia
	@mkdir -p $(@D)
	dia --export=$@ $<

$(BUILDDIR)illustrations/%.eps : $(ILLUSTRATIONSDIR)%.svg
	@mkdir -p $(@D)
	inkscape --export-eps=$@ -f $<

$(BUILDDIR)pdf/%.pdf : %.md $(SVGILLUSTRATIONS) $(DIAGRAMS) refs.bib
	@mkdir -p $(@D)
	pandoc $(PANDOC_OPTS) -t beamer -s $< --output $@ --template $(TEMPLATEDIR)default.beamer

$(BUILDDIR)tex/%.tex : %.md
	@mkdir -p $(@D)
	pandoc $(PANDOC_OPTS) -t beamer -s $< --output $@ --template $(TEMPLATEDIR)default.beamer

clean :
	rm $(DIAS) $(EPSS) $(PDFS)

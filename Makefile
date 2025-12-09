# --- Configuration ---
# Name of your main .tex file (without the extension)
MAIN = _v2

# Compiler commands
CC = pdflatex
BIB = bibtex

# --- Targets ---

# Default target: builds the PDF
all: $(MAIN).pdf

# The Build Sequence
# 1. Run pdflatex to generate the .aux file
# 2. Run bibtex to process the bibliography
# 3. Run pdflatex again to link citations
# 4. Run pdflatex a final time to resolve cross-references
$(MAIN).pdf: $(MAIN).tex
	$(CC) $(MAIN).tex
	$(BIB) $(MAIN)
	$(CC) $(MAIN).tex
	$(CC) $(MAIN).tex

# Quick build (runs pdflatex once; useful for checking layout changes)
quick:
	$(CC) $(MAIN).tex

# Clean up auxiliary files
clean:
	rm -f *.aux *.log *.bbl *.blg *.out *.toc *.lof *.lot

# Clean everything including the final PDF
distclean: clean
	rm -f $(MAIN).pdf

.PHONY: all quick clean distclean


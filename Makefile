PDF = simple.pdf

NB = $(PDF:.pdf=.ipynb)

all: $(PDF) $(NB)

%.ipynb: %.qmd
	quarto render $^ --to ipynb

## "-to pdf" will use latex route...
%.pdf: %.qmd
	quarto render $^ --to typst

.PHONY: clean crib.pdf


clean:
	rm -f $(PDF) $(NB)

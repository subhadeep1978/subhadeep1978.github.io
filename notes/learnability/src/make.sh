#!/bin/bash

ROOT=$(git rev-parse --show-toplevel)
PROJECT=learnability

SRC=$ROOT/notes/$PROJECT

# PDF
pdflatex $PROJECT.tex
bibtex $PROJECT

# HTML
pandoc "$PROJECT.tex" \
  -s \
  --toc \
  --toc-depth=3 \
  --number-sections \
  --mathjax \
  --citeproc \
  -c $ROOT/assets/css/style.css \
  -o index.html \
  --bibliography=references.bib

  # Mover over
  sed 's|img src=\"figures|img src="src/figures|g' index.html > index2.html
  mv index2.html $SRC/index.html
  mv learnability.pdf $SRC/learnability.pdf


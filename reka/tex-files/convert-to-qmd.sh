#!/usr/bin/env bash

for file in latex/*.tex; do
    base=$(basename "$file" .tex)
    pandoc \
        "$file" \
        -f latex \
        -t markdown \
        -s \
        --wrap=none \
        -o "quarto/${base}.qmd"
done
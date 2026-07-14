#!/usr/bin/env bash

for file in latex/*
do
    filename=$(basename "$file" .tex)
    pandoc "$file" -t markdown -o "quarto/$filename.qmd"
done

echo "Conversion complete!"
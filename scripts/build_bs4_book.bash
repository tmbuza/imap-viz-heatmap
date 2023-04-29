#!/bin/env bash

set -ev

Rscript -e "bookdown::render_book(
    input = 'index.Rmd',
    output_format = 'bookdown::bs4_book',
    clean = TRUE,
    output_dir = NULL,
    new_session = NA,
    config_file = '_bookdown.yml')
  "

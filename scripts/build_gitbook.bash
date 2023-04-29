#!/bin/env bash

set -ev

Rscript -e "bookdown::render_book(
    input = 'index.Rmd', 
    output_format = 'bookdown::gitbook',
    clean = TRUE,
    output_dir = NULL, 
    new_session = NA, 
    config_file = c('_bookdown.yml', '_output.yml', '.travis.yml'))
  "

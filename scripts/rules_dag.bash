#!/bin/env bash

set -ev

snakemake --rulegraph all | dot -Tsvg > dags/rulegraph.svg
snakemake --dag all | dot -Tsvg > dags/dag.svg


# Bioinformatics workflows
rule all:
    input:
        "_book/index.html",
        "gh-static-page/index.html"

# Generate bs4book
rule render_bs4book:
    input:
        script = "scripts/build_bs4_book.bash"
    output:
        "_book/index.html"
    shell:
        """
        R -q -e "bookdown::render_book('{input.script}', 'bookdown::bs4_book')"
        """


## Rmarkdown reporting rule
rule gh_static_page:
    input:
        rmd = "gh-static-page/index.Rmd",
        cicd = "img/cicd.png",
        varcall = "dags/varcall_rulegraph.svg",
        stardeseq = "dags/star_deseq_rulegraph.svg",
        quanti = "dags/drought_analysis_dag.svg",
        otuflow = "dags/otu_workflow.png",
        goenrich = "images/gene_ontology.png",
        micropml = "dags/mikropml_rulegraph.svg",

    output:
        "gh-static-page/index.html"
    shell:
        """
        R -e "library(rmarkdown); render('{input.rmd}')"
        """
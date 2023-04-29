# Bookdown Snakemake Template
rule all:
    input:
        "dags/dag.svg",
        "dags/rulegraph.svg", 
        "_book/index.html", 
        "visuals/nice-fig-1.png",      
        "ghp-index.html",     


rule rules_dag:
    input:
        script = "scripts/rules_dag.bash",
    output:
        "dags/dag.svg",
        "dags/rulegraph.svg"
    shell:
        """
        bash "{input.script}"
        """


rule render_book:
    input:
        script = "scripts/build_bs4_book.bash",
    output:
        "_book/index.html"
    shell:
        """
        bash "{input.script}"
        """

rule ghp_index:
    input:
        rmd = "ghp-index.Rmd",
        fig1 = "visuals/nice-fig-1.png",
        dag = "dags/dag.svg",
        rulegraph = "dags/rulegraph.svg"
    output:
        "ghp-index.html",
    shell:
        """
        R -e "library(rmarkdown); render('{input.rmd}')"
        """
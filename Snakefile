
# The following is an example snakemake file. Please delete and replace with the
# commands relevant for your project. 

rule all: 
    input:
        "output/main_report.pdf",
        "output/main_report.html"


rule clean:
    shell: "rm -f output/* log/*"


rule:
    input: "analysis/ad_cohort.R"
    output: "data/ad_cohort.Rds"
    shell: "./bin/rr analysis/ad_cohort.R"


rule:
    input: "analysis/t_stage.R"
    output: "output/t_stage.html"
    shell: "./bin/rr analysis/t_stage.R"


rule:
    input: "analysis/g_diag.R"
    output: "output/g_diag.png"
    shell: "./bin/rr analysis/g_diag.R"


rule:
    input: 
        "data/ad_cohort.Rds",
        "output/g_diag.png",
        "output/t_stage.html",
        "analysis/main_report.Rmd"
    output: "output/main_report.html"
    shell: "./bin/rr -t html analysis/main_report.Rmd"


rule:
    input:
        "data/ad_cohort.Rds",
        "output/g_diag.png",
        "output/t_stage.html",
        "analysis/main_report.Rmd"
    output: "output/main_report.pdf"
    shell: "./bin/rr -t pdf analysis/main_report.Rmd"
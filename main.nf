
process generate_report {
    container 'ghcr.io/bwbioinfo/quarto-docker-cwl:latest'

    publishDir "output", mode: 'copy'
    
    input:
    file results
    path template
    val report_name
    val report_title

    output:
    file "${report_name}.html"

    script:
    """
    quarto render report.qmd --to html \
    -P workflow_name:"${report_title}" \
    -P analysis_date:"\$(date +'%Y-%m-%d')" \
    -P results_file:"${results}" \
    --output ${report_name}.html
    """
}

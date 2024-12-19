
process generate_report {
    container 'ghcr.io/bwbioinfo/quarto-docker-cwl:latest'

    publishDir "output", mode: 'copy'
    
    input:
    file results
    path report_template
    val report_filename
    val report_title
    val report_description

    output:
    file "${report_filename}.html"

    script:
    """
    quarto render ${report_template} --to html \
    -P report_title:"${report_title}" \
    -P report_description:"${report_description}" \
    -P analysis_date:"\$(date +'%Y-%m-%d')" \
    -P results_file:"${results}" \
    --output ${report_filename}.html
    """
}

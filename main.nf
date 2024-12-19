
process GENERATE_REPORT {
    container 'ghcr.io/bwbioinfo/quarto-docker-cwl:latest'

    publishDir "output", mode: 'copy'
    
    tag "$meta.id"
    label 'process_low'

    publishDir "output", mode: 'copy'

    input:
    tuple val(meta),file(results)
    path report_template
    val report_title 
    val report_description

    output:
    tuple val(meta), path("*.html"), emit: report
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: '--all'
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    quarto render ${report_template} --to html \
    -P report_title:"${report_title}" \
    -P report_description:"${report_description}" \
    -P analysis_date:"\$(date +'%Y-%m-%d')" \
    -P results_file:"${results}" \
    --output ${prefix}.html

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        quarto: \$( quarto --version )
    END_VERSIONS
    """

    stub:
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        quarto: \$( quarto --version )
    END_VERSIONS
    """
}

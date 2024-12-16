[![Build and Push Docker Image](https://github.com/bwbioinfo/quarto-docker-cwl/actions/workflows/build-and-push.yml/badge.svg)](https://github.com/bwbioinfo/quarto-docker-cwl/actions/workflows/build-and-push.yml)

# Quarto-docker-cwl

This repository provides a [Common Workflow Language (CWL)](https://www.commonwl.org/) tool for running the [Quarto](https://quarto.org/) program. The tool is packaged in a Docker container, allowing it to run on any system with Docker or Singularity installed.

## Prerequisites

To use this tool, you must have the following software installed on your system:

- [CWL tool](https://github.com/common-workflow-language/cwltool)
- [Docker](https://www.docker.com/) OR [Singularity](https://sylabs.io/singularity/) OR [Apptainer](https://apptainer.org/)

## Installation

To install and run the tool, follow these steps:

1. Clone this repository to your local machine.
2. Install Docker, if you haven't already done so.
3. (optional) Build the Docker image by running the following command from the root of the repository:

    ```
    docker build -f docker/Dockerfile -t quarto-docker-cwl .
    ```
    OR pull from the built container:
    ```
    docker pull ghcr.io/bwbioinfo/quarto-docker-cwl:latest
    ```
   Note: this is only needed if you wish to access the container commands directly via Docker.

4. Run the CWL tool by running the following command from the root of the repository:

    ```
    cwl-runner quarto-tool.cwl quarto-inputs.yml
    ```
    OR
    ```
    cwl-runner --singularity quarto-tool.cwl quarto-inputs.yml
    ```

   This will run the Quarto software on the specified input file(s) defined in the `quarto-inputs.yml` file.

## Usage

To use the tool, you will need to create a YAML file specifying the input files and any other parameters you wish to specify. An example YAML file is provided in the `example` directory of this repository.

The `quarto-tool.cwl` file is the main workflow file that describes the steps for running Quarto. The `quarto-inputs.yml` file is an example input file that specifies the inputs and any other options you wish to use. The `quarto-tool.cwl` file includes the Docker specification. You can also use [Singularity](https://sylabs.io/singularity/) via the `cwl-runner` option `--singularity`.

The output of the tool will be written to a directory named `output` in the current working directory.

## Contributing

If you wish to contribute to this project, please follow the standard GitHub workflow:

1. Fork the repository
2. Create a new branch for your changes
3. Make your changes and commit them
4. Push your changes to your fork
5. Submit a pull request to this repository

## License

This project is licensed under the [MIT License](https://github.com/bwbioinfo/quarto-docker-cwl/blob/main/LICENSE).

## Contact

If you have any questions or feedback, please contact the author via GitHub.


# Use the official Alpine image as the base image
FROM ubuntu:latest

# Update the package list and install any necessary packages
RUN apt update && apt install -y \
    python3 \
    python3-pip \
    r-base-dev \
    wget

ENV CONTAINTER_NAME="Quarto with Tidyverse"
ENV R_LIBS_USER=/lib/R/site-library

RUN R -e "install.packages('knitr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyverse',dependencies=TRUE, repos='http://cran.rstudio.com/')"

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.39/quarto-1.6.39-linux-amd64.deb

RUN dpkg -i quarto-1.6.39-linux-amd64.deb

# Set the working directory in the container

WORKDIR /data

# Set the default command for the container

CMD [ "quarto" ]
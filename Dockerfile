# Base image  pre-installed
FROM rocker/r-ver:4.3.0 AS base

# Install system dependencies often required by R packages
RUN apt-get update && apt-get install -y \
    pandoc \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev \
    make \
    && apt-get clean

# Create a project root directory and set it as the working directory
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

# Create commonly used subdirectories
RUN mkdir -p data output report script renv

# Copy renv environment files (used to recreate the same R package environment)
COPY .Rprofile ./
COPY renv.lock ./
COPY renv/activate.R renv/
COPY renv/settings.json renv/

#restore the renv environment during build
RUN R -e "renv::restore()"

# Copy project files
COPY data/ data/
COPY Final_project.Rmd .
COPY script/ script/
COPY makefile .

# Set the default command to run when the container starts (Makefile must exist)
CMD ["make"]

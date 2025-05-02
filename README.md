# EEG Data Analysis Report

## Overview
This repository contains the R Markdown code to generate an EEG data analysis report, exploring EEG recordings from 10 college students as they watched MOOC videos of varying difficulty levels. The dataset includes EEG signals and self-reported confusion ratings, providing an opportunity for feature selection, classification modeling, and causal inference based on EEG Theta wave activity.

## Contents of the Report
The final report includes:
1. **Exploratory Data Analysis (EDA)** of EEG signals, focusing on key variables such as brainwave frequency bands (e.g., Delta, Theta, Alpha, Beta, Gamma).
2. **Summary statistics**, including median values and interquartile ranges for various metrics, with a comparison of different video conditions and brainwave activities.
3. **Visualizations** of brainwave frequency distributions, including Delta and Theta bands.

## How to Generate the Final Report

Execute make or

### Generate Required Summary Table
Run script/table_gen.R

### Generate Required Figure
Run script/figure_gen.R

### Generate Final_Report
Knit Final_project.Rmd

## Requirements
Make sure the following packages are installed in your R environment:
- `knitr`
- `ggplot2`
- `dplyr`
- `here`
- `readr`
- `png`
- `grid`


## Reproducing the Environment

This project uses the `renv` package to manage dependencies.

To install the required packages, run:

"make install"

## Docker Image

### Docker Image Link
https://hub.docker.com/repository/docker/raylonc02/final-report-image/general

### Building Image
run "make image-build"

### Running the automated version of the image
If you are mac user with m chips:
run "make run-report-mac-m"

If you are mac user with amd chips:
run "make run-report-mac-amd"

If you are win user with amd chips:
run "make run-report-win"


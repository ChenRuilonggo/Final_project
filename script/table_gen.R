library(dplyr)
library(gtsummary)
library(readr)
library(here)

# Load dataset
data <- read_csv(here::here("data", "EEG_data.csv"))


# Grouped summary with statistical tests
grouped_summary <- gtsummary::tbl_summary(data, by = "predefinedlabel") %>%
  gtsummary::add_p() %>%
  gtsummary::bold_labels()

# Save the grouped summary table to an HTML file
gtsummary::as_gt(grouped_summary) %>%
  gt::gtsave(here::here("output", "grouped_summary.html"))

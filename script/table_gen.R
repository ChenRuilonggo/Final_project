library(dplyr)
library(gtsummary)
library(readr)
library(here)

# Load dataset
data <- read_csv(here::here("data", "EEG_data.csv"))

# Generate a summary table for specific variables
summary_table <- data %>%
  select(Attention, Mediation, Delta, Theta, Alpha1, Alpha2, Beta1, Beta2, Gamma1, Gamma2) %>%
  summary()

# Save the summary table as a CSV file in the output folder
write_csv(as.data.frame(summary_table), here::here("output", "summary_table.csv"))

# Grouped summary with statistical tests
grouped_summary <- gtsummary::tbl_summary(data, by = "predefinedlabel") %>%
  gtsummary::add_p() %>%
  gtsummary::bold_labels()

# Save the grouped summary table to an HTML file
gtsummary::as_gt(grouped_summary) %>%
  gt::gtsave(here::here("output", "grouped_summary.html"))

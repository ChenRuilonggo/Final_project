# figure_gen.R

library(ggplot2)
library(readr)
library(here)

# Load dataset
data <- read_csv(here::here("data","EEG_data.csv"))

# Plot histogram of Delta Band
ggplot(data, aes(x = Delta)) + 
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Distribution of Delta Band", x = "Delta Value", y = "Frequency")

ggsave("output/delta_distribution.png")

# Plot histogram of Theta Band
ggplot(data, aes(x = Theta)) + 
  geom_histogram(binwidth = 1000, fill = "blue", color = "black") +
  labs(title = "Distribution of Theta Band", x = "Theta Value", y = "Frequency")

ggsave("output/theta_distribution.png")

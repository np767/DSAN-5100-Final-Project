library(tidyverse)
hpi_data <- read_csv("data/hpi_data.csv")
states_to_keep <- c("California", "New York", "Ohio", "Michigan", "Florida", "Utah")
hpi_clean <- hpi_data %>%
  filter(State %in% states_to_keep) %>%
  select(State, Year, HPI) %>%
  mutate(Percentage_Increase = HPI - 100) %>%
  arrange(State, Year)
print(paste("Missing values:", sum(is.na(hpi_clean))))
write_csv(hpi_clean, "data/processed-data/hpi_cleaned.csv")
print("Data cleaning complete!")

library(tidyverse)

# Import data
# If you are testing this outside my repo, please change the url
data_url <- "~/R/delfina-ds-interview/data/birthdata2020.csv"
birth_data <- read.csv(data_url, header = TRUE)

# Explore data

head(birth_data)

cols <- colnames(birth_data)

typeof(cols)
length(cols)
cols[1]

# Create a data dictionary to better understand the variables
data_description <- data.frame(var_codes = cols)
write.csv(data_description,
    file =
        "~/R/delfina-ds-interview/data/data_dictionary.csv"
)


# Q1 proportion of births by gestational age
# I will use COMBGEST as the metric

birth_data %>% 
  filter(COMBGEST<99) %>% 
  mutate(is_preterm = case_when(
    COMBGEST < 37 ~ "Yes",
    TRUE ~ "No"
  )) %>% 
  group_by(is_preterm) %>% 
  summarise(n_cases = n()) %>%
  #mutate(percentage = 100* round(n_cases / sum(n_cases), 3))
  mutate(percentage = 100* (n_cases / sum(n_cases)))


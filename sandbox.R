library(tidyverse)

# Import data
# If you are testing this outside my repo, please change the url
data_url <- "~/R/delfina-ds-interview/data/birthdata2020.csv"
birth_data <- read.csv(data_url, header = TRUE)

# Explore data
head(birth_data)
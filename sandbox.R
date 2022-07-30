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
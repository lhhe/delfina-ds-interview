library(tidyverse)

# Import data
# If you are testing this outside my repo, please change the url
data_url <- "~/R/delfina-ds-interview/data/birthdata2020.csv"
birth_data <- read.csv(data_url, header = TRUE)

# Explore data

head(birth_data)

cols <- colnames(birth_data)



# Create a data dictionary to better understand the variables
data_description <- data.frame(var_codes = cols)
write.csv(data_description,
    file =
        "~/R/delfina-ds-interview/data/data_dictionary.csv"
)



## Creating  bins


## MAGER
cuts <- c(0,19,29,39,49,59)
bin_labs <- c("< 19", "20-29", "30-39", "40-49", " >= 50")

birth_data %>% 
  mutate(age_bins = cut(MAGER, breaks=cuts, labels=bin_labs)) %>% 
  filter(MAGER==29) %>% 
  select(MAGER, age_bins) %>% 
  data.table()

sum(birth_data$MAGER==50)
min(birth_data$MAGER)

## PREVIS

mean(birth_data$PREVIS)
sd(birth_data$PREVIS)
min(birth_data$PREVIS)
max(birth_data$PREVIS)

sum(birth_data$PREVIS==99)

birth_data <- birth_data %>% 
  mutate(PREVIS = na_if(PREVIS, 99))



#How many bins?
birth_data %>% 
  ggplot(aes(PREVIS))+
  geom_histogram(bins=4, fill=NA, color="blue")+
  geom_histogram(bins=8, fill=NA, color="orange")+
  geom_histogram(bins=10, fill=NA, color="red")

PREVIS_cuts <- c(0,5,10,15,100)
PREVIS_labels <- c("< 5", "5-9",
                   "10-14", "> 15")

birth_data %>% 
  mutate(PREVIS = na_if(PREVIS, 99)) %>% 
  mutate(PREVIS_bins = cut(PREVIS, breaks =PREVIS_cuts, right=FALSE, labels=PREVIS_labels)) %>% 
  select(PREVIS, PREVIS_bins) %>% 
  #filter(PREVIS >20) %>% 
  head(20)



##MRACESHIP
birth_data %>% 
  group_by(is_preterm, as.factor(MRACEHISP)) %>% 
  tally() %>% 
  spread(is_preterm, n)


## recode

birth_data %>%
  mutate(MRACE_strg = recode(MRACEHISP,
                             `1` = "White",
                             `2` = "Black",
                             `3` = "AIAN",
                             `4` = "Asian",
                             `5` = "NHOPI",
                             `6` = "Mixed",
                             `7` = "Hispanic",
                             `8` = "Unknown")) %>% 
  select(MRACEHISP, MRACE_strg)


### logistic model

logistic_model <- glm(is_preterm_binary~MAGER+MRACEHISP+RF_PPTERM+PREVIS, data= birth_train_data)
summary(logistic_model)

hist(predict(logistic_model))
pred_resp <- predict(logistic_model, type="response")
hist(pred_resp)
length(pred_resp)
length(birth_train_data)


library("ggplot2")
library("dplyr")
library("tidyr")

summary_data <- read.csv('Data/Colony_Condition/Summary_Data.csv',
                             stringsAsFactors = FALSE)

select_values <- summary_data$Site







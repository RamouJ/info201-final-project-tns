#The Cofounders Problem
summary_data <- read.csv("Data/Colony_Condition/Summary_Data.csv")

summary_data <- summary_data %>%
  select(Site, General_Disease, Herm, Snails, Total, Percent_Disease)%>%
  gather(key = "Diseases", value = "Amount_Diseased", -Site, -Total, -Percent_Disease) %>%
  mutate(Percentage = Amount_Diseased / Total *100)


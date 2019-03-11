library("ggplot2")
library("dplyr")
library("tidyr")

colony_condition <- read.csv('Data/Colony_Condition/colony_condition.csv',
                        stringsAsFactors = FALSE)

colony_condition <- na.omit(colony_condition)

colony_condition <- colony_condition %>%
  select(Site, Disease, Herm, Snails, Total)


filtered <- colony_condition %>%
  filter(Site == "Pickles") %>%
  summarize(total_disease = sum(filtered$Disease),
            total_herm = sum(filtered$Herm),
            total_snails = sum(filtered$Snails),
            final_total = sum(filtered$Total))

ggplot(data = filtered_2) +
  geom_col(mapping = aes(x = data, y = data))






disease_sum <- sum(filtered$Disease)

herm_total <- sum(filtered$Herm)

snails_total <- sum(filtered$Snails)


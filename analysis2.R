library("dplyr")
library("ggplot2")

mitigation_data <- read.csv("Data/Mitigation_Experiments/mitigation_experiments_2.csv")

control_grouped_data <- mitigation_data %>%
  filter(Treatment == "control") 

count_control <- as.data.frame(table(control_grouped_data$Tissue_Loss_Progression)) 

epoxy_grouped_data <- mitigation_data %>%
  filter(Treatment == "epoxy band")

epoxy_grouped_control <- as.data.frame(table(epoxy_grouped_data$Tissue_Loss_Progression))

excision_grouped_data <- mitigation_data %>%
  filter(Treatment == "excision")

excision_grouped_control <- as.data.frame(table(excision_grouped_data$Tissue_Loss_Progression)) 

control_plot <- ggplot(data = count_control) +
  geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkblue") +
  labs(
    x = "Control group's tissue loss in binary with ratio of 13:25",
    y = "Amount lost"
  )

epoxy_plot <- ggplot(data = epoxy_grouped_control) +
  geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkgreen") +
  labs(
    x = "Epoxy group's tissue loss in binary with ratio of 19:23",
    y = "Amount lost"
  )

excision_plot <- ggplot(data = excision_grouped_control) +
  geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkred") +
  labs(
    x = "Excision group's tissue loss in binary with ratio of 12:15",
    y = "Amount lost"
  )

choices_treatment <- c("Control", "Epoxy", "Excision")

complete_set <- rbind(count_control, epoxy_grouped_control, excision_grouped_control)

filler <- data.frame(Treatment = c("Control", "Epoxy", "Excision")) 

full_set <- merge(filler, complete_set)

full_set <- full_set[-c(2, 3, 4, 6, 7, 8), ]

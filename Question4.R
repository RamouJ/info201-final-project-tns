## Michael Question 4
##Does tissue loss directly relate to the treatment types?
##By answering this question, we may be able to find out the treatment that minimizes tissue loss of the colonies.
library("dplyr")
library("ggplot2")

mitigation_experiments <- read.csv(file = "Data/Mitigation_Experiments/mitigation_experiments.csv")



summary_me_treatment <- mitigation_experiments %>% 
                        group_by(Treatment_Description) %>% 
                        summarize(
                        'Mean TLP' = mean(Tissue_Loss_Progression)
                        )

summary_me_site <- mitigation_experiments %>%
  group_by(Site) %>% 
  summarize(
    'Mean TLP' = mean(Tissue_Loss_Progression)
  )

Treatment <- c("Epoxy Band", "Control", "Excision")

as.data.frame(Treatment)

treatment_data <- cbind(Treatment, summary_me_treatment)

treatment_data <- colnames("Treatment", "Treatment Description", "Mean TLP")

View(treatment_data)

View(summary_me_site)

View(mitigation_experiments)

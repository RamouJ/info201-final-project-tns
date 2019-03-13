library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
library("jpeg")
install.packages("jpeg")
source("Question4.R")
ui <- navbarPage(
      "Caribbean Coral Reef Analysis: Mitigating White Band Disease",
                  tabPanel("Introduction", 
                          h2("Disease Dynamics and Potential
                          Mitigation Among Restored and Wild Caribbean Staghorn Coral", align = "center"),
                          p("Our dataset is from NOAA (National Oceanic and Atmospheric Administration) and is 
                            an experiment looking into the disease dynamics and potential mitigation among 
                            restored and wild staghorn coral. Caribbean staghorn coral has been given protected status. 
                            Nearly 97% of the coral was wiped out since the 1980s from white band disease, a disease 
                            that destroys the coral's tissue. The dataset focuses on an experiment to attempt to cure 
                            the coral of the disease with different control groups. This data is important given that 
                            staghorn coral used to be very abundant in the Caribbean and was a key part of the ecosystem, 
                            as many of the coral have built the reefs to sustain the ecosystem. It provides important habitat 
                            for the reef animals, especially the fish. The current population of coral now only lies in a few 
                            isolated colonies comapred to the forests of the coral that used to dominant the reefs. Successful
                            reproduction is difficult so it is vital to find a way to combat the disease and environmental factors that kill the coral. "),
                          tags$img(src = "/Data/about/www/0159175_map.jpg"),
                          p("The questions we will be highlighting in our app are: "),
                          tags$ol(
                            tags$li("Could there be any confounders that are causing coral reefs to deteriorate?  "), 
                            tags$li("What's the best possible treatment for the colony that has caught a disease? "), 
                            tags$li("Are there any disease patterns on each type of colonies? "),
                            tags$li("Does tissue loss directly relate to the treatment types? ")
                          )
                           
                           ),
                  tabPanel("Question 1"
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2"
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 3" 
                           
                           
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 4",
                  h2("Does tissue loss directly relate to the treatment types?", align = "center"), 
                  br(), br(),
                  tableOutput("Question4Table1"),
                  br(), em("Analysis: ", style = "font-family: 'verdana'; font-si24pt"), 
                  p("In looking at the data, no one treatment type comes out on top. The data shows the mean tissue loss
                    progression across all the colonies that used a given treatment type. The most effective
                    treatment thus far has been the Epoxy Band treatment, with about 55% of the coral still 
                    showing tissue loss progression after 4 weeks of having the treatment. The Excision treatment 
                    was a close second with about 56% of the coral showing tissue loss progression. Even though 
                    both treatment methods were not very effective in mitigating the disease, there is still signs 
                    of success. Both treatments beat the control group with no treatment by 10%, which shows there 
                    was some effectiveness in mitigating the white band disease. Other external factors may be contributing 
                    the effectiveness of the different trreatments, such as the site location.", 
                    style = "font-family: 'verdana'; font-si20pt") 
                           
                           )
)

server <- server <- function(input, output) {
  output$Question4Table1 <- renderTable({
    data <- treatment_data
    
    data
    
  })
  output$Question4Table2 <- renderDataTable({
    data <- summary_me_site
    
    data
    
  })
}

shinyApp(ui = ui, server = server)


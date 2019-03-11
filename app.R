library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")

source("question3.R")

ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",
                  tabPanel("Introduction" 
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 1", 
                           selectInput(
                             "feature",
                             label = "Feature of Interest",
                             choices = select_values,
                             selected = "Aquarius"
                           )
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2"
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 3"
                           
                           
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 4"
                           
                           
                           
                           
                           
                           
                           )
)

server <- server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)


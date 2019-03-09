library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")

ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",
                  tabPanel("Introduction", 
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 1"
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2",
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 3", 
                           
                           
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 4", 
                           
                           
                           
                           
                           
                           
                           )

server <- server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)


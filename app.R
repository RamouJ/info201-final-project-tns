library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")

source("analysis2.R")

ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",
                  tabPanel("Introduction", 
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 1"
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2",
                       titlePanel("Best possible treatment"),
                       sidebarPanel(
                         sidebarLayout(
                          radioButtons(
                            inputId = "type", 
                            label = "Treatment type:",
                            c("Control" = "Control",
                              "Epoxy" = "Epoxy",
                              "Excision" = "Excision"
                            )
                          )
                        )
                      )
                    ),
                  tabPanel("Question 3", 
                           
                           
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 4", 
                           
                           
                           
                           
                           
                           
                           )

server <- server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)


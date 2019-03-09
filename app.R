library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")

ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",

      tabsetPanel(type = "tabs",
                  tabPanel("Introduction", plotOutput("plot")),
                  tabPanel("Question 1", tableOutput("table")),
                  tabPanel("Question 2", tableOutput("table")),
                  tabPanel("Question 3", tableOutput("table")),
                  tabPanel("Question 4", tableOutput("table"))
    )
)


server <- server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)

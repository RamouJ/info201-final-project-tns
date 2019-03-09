library("shiny")

ui <- fluidPage(
  
  # App title ----
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Introduction", plotOutput("plot")),
                  tabPanel("Question 1", tableOutput("table")),
                  tabPanel("Question 2", tableOutput("table")),
                  tabPanel("Question 3", tableOutput("table")),
                  tabPanel("Question 4", tableOutput("table"))
      )
    )
  )
)


server <- server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)
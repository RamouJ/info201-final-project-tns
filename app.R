library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
library("plotly")

source("question3.R")
source("question1.R")
ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",
                  tabPanel("Introduction" 
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 1",
                           titlePanel("Potential Cofounders of Diseases"),
                           sidebarLayout(
                             sidebarPanel(
                               
                               selectInput(inputId = "site", label = "Site of Observation", choices = summary_data$Site, selected = "Wild_Site_A"),
                               br(),
                               radioButtonsinputId = "diseases", label = "Disease Compilation",
                               choices = list("General_Disease" = 1, "Worm Bites" = 2, "Snail Colonies" = 3), 
                               selected = 1),
                             
                             mainPanel(
                               tabsetPanel(type = "tabs",
                                           tabPanel("Plot", plotlyOutput("plot_q1"),
                                                    p(" ")),
                                           
                                           tabPanel("Table", DT::dataTableOutput("table_q1"), 
                                                    p(" "))
                               )
                             )
                           )
        
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2"
                             
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 3", 
                           titlePanel("Question: What are the disease patterns
                                      in each colony?"
                           ),
                           selectInput(
                             "feature",
                             label = "Feature of Interest",
                             choices = select_values,
                             selected = "Aquarius"
                           ),
                           plotOutput("plot"),
                           br(),
                           p("Diseases Explained: The General Disease value, is
                              the number of colonies tallied with active 
                              disease. The Herm value, is the number of 
                              colonies tallied with recent predation scars by
                              fireworms. The Snails value, is the number of
                              colonies tallied with corallivorous snails."
                           ),
                           br(),
                           textOutput("plot_info"),
                           br()
                           ),
      
                  tabPanel("Question 4"
                           
                           
                           
                           
                           
                           
                           )
)

server <- function(input, output) {

  output$plot_q1 <- renderPlotly({
    filtered_data <- summary_data %>%
      filter(Diseases == input$diseases)%>%
      filter(Site == input$site)
    
    p <- ggplot(data = filtered_data)+
      geom_col(mapping = aes_string(x = "diseases", y = "Amount_Diseased", fill = "Site"))
    ggplotly(p)
  })
  
  output$table_q1 <- DT::renderDataTable(
    filtered_coral <- year_forest_perc %>%
      filter(Diseases == input$diseases)%>%
      filter(Site == input$site),
    options = list(lengthChange = FALSE)
  )
  
  output$plot <- renderPlot({
    filtered_table <- filtered_df <- summary_data %>%
      filter(Site == input$feature) %>%
      gather(key = Diseases, value = Site)
    
    filtered_df <- filtered_table %>%
      filter(!Diseases == "Total",
             !Diseases == "Lowest_Disease",
             !Diseases == "Max_Disease",
             !Diseases == "Percent_Disease") 
    
    ggplot(data = filtered_df) + 
      geom_col(mapping = aes(x = Diseases, y = Site)) +
      labs(y = "# of Observations", 
           title = paste("Disease Patterns in the",
                          input$feature,
                          "Colony"
                         )
           )
  })
  
  output$plot_info <- renderText({
    filtered_table <- summary_data %>%
      filter(Site == input$feature) %>%
      gather(key = Diseases, value = Site)
    
    paste0("This bar chart above, shows the data for the ",
          input$feature, 
          " colony. ",
          "The largest disease recorded was ",
          filtered_table$Site[5],
          " while the lowest number of disease observations was ",
          filtered_table$Site[6], ". On average, ", filtered_table$Site[7],
          "% of the total population at the site was diseased.")
  })
  
  
  
}

shinyApp(ui = ui, server = server)


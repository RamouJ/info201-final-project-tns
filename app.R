library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
library("plotly")
library("tidyverse")
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
                               br()
                             ),
                          
                             mainPanel(
                               tabsetPanel(type = "tabs",
                                           tabPanel("Plot", plotlyOutput("plot_q1"),
                                                    p("There does not seem to be a correlation in the disease developing in the nursery site, 
                                                      given that no snails or herm were present and the disease developed. 
                                                      However, in cases involving a high mean herm the disease is generally prevalent and the mean number of snails goes down. 
                                                      In looking at the combined dataset, the top three sites with the highest mean herm had the highest mean tissue loss, 
                                                      showing that herm could have an impact on the disease's ablility to deteriate the coral's tissue.")),
                                           tabPanel("PercentagePlot", plotlyOutput("plot_percentage_q1"),
                                                    p("")
                                                    ),
                                           tabPanel("Circular Plot", plotOutput("plot_q1_circular")),

                                           
                                           
                                           tabPanel("Table", DT::dataTableOutput("table_q1"), 
                                                    p("There does not seem to be a correlation in the disease developing in the nursery site, 
                                                      given that no snails or herm were present and the disease developed. 
                                                      However, in cases involving a high mean herm the disease is generally prevalent and the mean number of snails goes down. 
                                                      In looking at the combined dataset, the top three sites with the highest mean herm had the highest mean tissue loss, 
                                                      showing that herm could have an impact on the disease's ablility to deteriate the coral's tissue."))
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
  output$plot_q1_circular <- renderPlot({
    p <- ggplot(data = summary_data)+
      geom_bar(mapping = aes_string(x = as.factor("Site"), y = "Amount_Diseased"))+
      ylim(-100,120) +
      theme_minimal()+
      theme(
        axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank(),
        plot.margin = unit(rep(-2,4), "cm")     # This remove unnecessary margin around plot
      ) +
      coord_polar(start = 0)+
      
    ggplotly(p)
  })
  output$plot_q1 <- renderPlotly({
    filtered_data <- summary_data %>%
      filter(Site == input$site)
    
    p <- ggplot(data = filtered_data)+
      geom_col(mapping = aes_string(x = "Diseases", y = "Amount_Diseased", fill = "Diseases"))
    ggplotly(p)
  })
  
  output$plot_percentage_q1 <- renderPlotly({
    filtered_data <- summary_data %>%
      filter(Site == input$site)
    p <- ggplot(data = filtered_data)+
      geom_col(mapping = aes_string(x = "Diseases", y = "Percentage", fill = "Diseases"))
    ggplotly(p)
  })
  output$table_q1 <- DT::renderDataTable(
    filtered_data <- summary_data %>%
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


library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")


source("analysis2.R")

source("question3.R")


my_ui <- navbarPage(
      "Caribbean Coral Reef Analysis: White Band Disease",
                  tabPanel("Introduction" 
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 1"
        
                           
                           
                           
                           
                           
                           
                           ),
                  tabPanel("Question 2",
                      h2(
                        "What's the best possible treatment for the colony that has caught a disease?",
                       align = "center"
                      ),
                       selectInput(
                         "treatment",
                         label = "Type of treatment",
                         choices = choices_treatment,
                         selected = "Control"
                       ),
                       plotOutput("plot_treatment"),
                       br(),
                       p("These bar graphs represent the number of coral colonies' tissue loss or gain depending on the type of
                         treatment using binary, with 0 representing no tissue loss and 1 representing above 0 % tissue
                         loss in the colony. Overall, epoxy group had the lowest no loss to loss ratio of 19:23, giving 
                         a validation that epoxy band might be the best treatment for the dying coral colony."),
                       p("1. Control: Control group gets no special treatments."),
                       p("2. Epoxy: Epoxy involves placement of a band of epoxy fully enclosing the diseased margin."),
                       p("3. Excison: Excision involves forcibly removing a diseased branch from the healthy ones.")),
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
                              colonies tallied with corallivorous snails.",
                             style = "font-family: 'verdana'; font-si24pt"
                           ),
                           br(),
                           textOutput("plot_info"),
                           br()
                           ),
      
                  tabPanel("Question 4"
                           
                           
                           
                           
                           
                           
                           )
)

server <- function(input, output) {

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

  output$plot_treatment <- renderPlot({
    if(input$treatment == "Control"){
    control_plot <- ggplot(data = count_control) +
      geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkblue") +
      labs(
        x = "Control group's tissue loss in binary with ratio of 13:25",
        y = "Number of colonies"
      )
    type_control <- control_plot
    }else if(input$treatment == "Epoxy"){
    epoxy_plot <- ggplot(data = epoxy_grouped_control) +
      geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkred") +
      labs(
        x = "Epoxy group's tissue loss in binary with ratio of 19:23",
        y = "Number of colonies"
      )
    type_control <- epoxy_plot
    }else if(input$treatment == "Excision"){
    excision_plot <- ggplot(data = excision_grouped_control) +
      geom_col(mapping = aes_string(x = "Var1", y = "Freq"), fill = "darkgreen") +
      labs(
        x = "Excision group's tissue loss in binary with ratio of 12:15",
        y = "Number of colonies"
      )
    type_control <- excision_plot
    }
    type_control
  }) 
}

shinyApp(ui = my_ui, server = server)


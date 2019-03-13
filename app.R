library("shiny")
library("ggplot2")
library("dplyr")
library("tidyr")
library("plotly")
library("jpeg")

source("question1.R")
source("analysis2.R")
source("question3.R")
source("Question4.R")
library("tidyverse")

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
                          imageOutput("img"),
                          p("The questions we will be highlighting in our app are: "),
                          tags$ol(
                            tags$li("Could there be any confounders that are causing coral reefs to deteriorate?  "), 
                            tags$li("What's the best possible treatment for the colony that has caught a disease? "), 
                            tags$li("Are there any disease patterns on each type of colonies? "),
                            tags$li("Does tissue loss directly relate to the treatment types? ")
                          )
                           
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
        
                           
                           
                           
                           
                           
                           
<<<<<<< HEAD
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
      
=======
                  tabPanel("Question 2"
                             
                           
                           
                           
                           
                           
                           ),
>>>>>>> QUESTION1
                  tabPanel("Question 3", 
                           h2(
                             "What are the disease patterns in each colony?",
                             align = "center"
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

<<<<<<< HEAD
server <- function(input, output) {
=======
>>>>>>> QUESTION1

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
<<<<<<< HEAD

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
=======
  
  
>>>>>>> QUESTION1
  
  output$Question4Table1 <- renderTable({
    data <- treatment_data
    
    data
    
  })
  
  output$img <- renderImage({
    imageFile <- "./www/map.jpeg"
    
    imageFile
    
  }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)


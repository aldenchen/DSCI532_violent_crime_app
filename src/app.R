library(shiny)
library(tidyverse)
library(ggplot2)
ucr_crime <- read.csv("ucr_crime_1975_2015.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  
  # Panels
  
  # App title
  titlePanel("US Violent Crime Visualization App", 
             windowTitle = "Year Range"),
  
  # Sidebar layout with input and output definitions ---- position on right
  sidebarLayout(position = "right",
    
    # Sidebar to demonstrate various slider options ----            
    sidebarPanel(
      
      #Input: Year Range
      sliderInput("year_line", "Select your desired year range:",
                  min = 1975, max = 2015, value = c(1975,2015)),
      
      #Input: Year Selected ---- Bar Chart
      sliderInput("year_bar", "Select your desired year for bar:",
                  min = 1975, max = 2015,
                  value = 1985),
      hr(),
      
      #Input: Selected Cities -----
      selectInput("city","Choose a city:",
                  choices = ucr_crime$department_name),
      
      #Input: Select Crime type ----
      radioButtons("crime_type", "Crime Type:",
                   choices = c(Rape = 'rape_per_100k',
                               Homicide = 'homs_per_100k',
                               Robbery = 'rob_per_100k',
                               `Aggravated Assault` = 'agg_ass_per_100k',
                               All = 'violent_per_100k'),
                   selected = "violent_per_100k")
      
    ),
    
    # Main panel for displaying outputs -----
    mainPanel(
       fluidRow(plotOutput("crime_hist"), 
                plotOutput("crime_ts"))
    )
  )
)



# Define server logic required to draw a histogram and a time series
server <- function(input, output) {
  
  # Reactive expression to create data frame of all input values ----
  
  crime_hist_df <- reactive({
    ucr_crime %>% 
      filter(department_name %in% c("Chicago", "Cleveland", "Columbus, Ohio")) %>%
      filter(year == input$year_bar)})
      #ggplot(aes(x=department_name,y=violent_per_100k)) +geom_histogram(stat="identity")
  #})
  
  
  crime_ts_df <- reactive({
    ucr_crime %>% 
      filter(department_name %in% c("Chicago", "Cleveland", "Columbus, Ohio")) %>%
      #filter(department_name =="Chicago") %>%
      filter(year <= input$year_line[2] & year >= input$year_line[1])})
  
      #ggplot(aes(year,violent_per_100k, colour=department_name)) + geom_line()

    output$crime_hist <- renderPlot(
      crime_hist_df() %>% 
        ggplot(aes(x=department_name,y=violent_per_100k)) +geom_histogram(stat="identity"))
    output$crime_ts <- renderPlot(
      crime_ts_df() %>% 
        ggplot(aes(year,violent_per_100k, colour=department_name)) + geom_line())
    
  }
  

# Run the application 
shinyApp(ui = ui, server = server)
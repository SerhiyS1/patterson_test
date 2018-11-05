#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(readxl)

raw <- read_excel("Summary_of_NZ_Wines.xlsx")
raw

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("category",
                     "Select:",
                     c("Number of Wineries" = "Number of wineries",
                       "Number of Growers" = "Number of growers",
                       "Producing Area" = "Producing area",
                       "Average Yield" = "Average yield",
                       "Average Grape Price" = "Average grape price",
                       "Tonnes Crushed" = "Tonnes crushed",
                       "Total Production" = "Total production",
                       "Domestic sales of NZ wine" = "Domestic sales of NZ wine",
                       "Consumption Per Capita NZ" = "Consumption per capita NZ",
                       "Total Domestic Sales of All" = "Total domestic sales of all",
                       "Consumption Per Capita" = "Consumption per capita",
                       "Export Volume" = "Export volume",
                       "Export Value" = "Export value"
                       )
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)


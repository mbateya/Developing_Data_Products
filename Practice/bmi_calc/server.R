#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    bmi <- reactive({
        wt <- input$weight
        ht <- input$height
        round(wt/((ht/100)^2),1)
    })
    output$bmi <- renderText({bmi()})
    
    output$category <- renderText({
        case_when(bmi() > 30 ~ "obese"
                  bmi() > 25 ~ "overweight"
                  bmi() > 18 ~ "normal"
                  TRUE ~ "underweight")

    })

})

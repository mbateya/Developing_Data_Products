


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
        ifelse(is.null(wt)|is.null(ht),0,round(wt / ((ht / 100) ^ 2), 1))
    })
    output$bmi <-
        renderText({
            case_when(
                bmi() > 0 ~ as.character(bmi()),
                TRUE ~ ""
            )
        })
    
    output$category <- renderText({
        case_when(
            is.null(bmi()) ~ "",
            bmi() > 30 ~ "Obese",
            bmi() > 25 ~ "Overweight",
            bmi() > 18 ~ "Normal",
            bmi() > 0 ~ "underweight",
            TRUE ~ ""
        )
        
    })
    
})

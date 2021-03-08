#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Body Mass Index (BMI) Calculator"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("weight",
                        "Weight (Kg):",
                        min = 1,
                        max = 200,
                        value = 70),
            sliderInput("height",
                        "Height (cm):",
                        min = 1,
                        max = 250,
                        value = 170)
            
        ),
    
        # Show a plot of the generated distribution
        mainPanel(
             textOutput("bmi"),
             textOutput("category")
        )
    )
))

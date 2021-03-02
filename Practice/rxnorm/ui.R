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
    titlePanel("RXNorm RXCUI"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("Med1", "Med Name", value = "", width = '1000px', 
                      placeholder = "Enter brand or generic name"),
            textInput("Med2", "Med Name", value = "", width = '1000px', 
                      placeholder = "Enter brand or generic name")
        ),

        # Show text of the RXCUI
        mainPanel(
            h3("Interactions:"),
            textOutput("DDI")
        )
    )
))

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
    titlePanel("Drug-Drug Interactions"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("Med1", "Med Name", value = "", width = '1000px', 
                      placeholder = "Enter brand or generic name"),
            textInput("Med2", "Med Name", value = "", width = '1000px', 
                      placeholder = "Enter brand or generic name"),
            submitButton("Check")
        ),

        # Show text of the RXCUI
        mainPanel(
            p("This application checks drug-drug interactions for a pair of medications. The application is intended
             for training purposes to fulfill the requirements of course project in the Coursera Johns Hopkins Data Science 
              Data Product Development course. Interaction data are obtained from the US National Library of Medicine RXNORM databse using
              and Application Programming Interface (API). This application does not intended to provide medical advice"),
            h5("Disclaimer from Source:"),
            p("It is not the intention of NLM to provide specific medical advice, but rather to provide users with 
              information to better understand their health and their medications. NLM urges you to consult with 
              a qualified physician for advice about medications."),
            h3("Interactions:"),
            textOutput("desc"),
            tableOutput("details1")
        )
    )
))

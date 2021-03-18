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
  titlePanel("Adult Body Mass Index (BMI) Calculator"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(sidebarPanel(
    tags$p("Enter your weight and height then press Enter or Tab to calculate your Body
              Mass Index (BMI):"),
    tags$br(),
    radioButtons("method", NULL, c("Metric", "English")),
      conditionalPanel(
        condition = "input.method == 'Metric'",
        numericInput(
          "weight_m",
          "Weight (kilograms):",
          min = 0,
          max = 300,
          step = 0.5,
          value = NULL
        ),
        
        numericInput(
          "height_m",
          "Height (centimeters):",
          min = 0,
          max = 250,
          step = 0.5,
          value = NULL
        )
        
      )
      ,      conditionalPanel(
        condition = "input.method == 'English'",
        numericInput(
          "weight_e",
          "Weight (pounds):",
          min = 0,
          max = 300,
          step = 0.5,
          value = NULL
        ),
        numericInput(
          "height_e",
          "Height (inches):",
          min = 0,
          max = 250,
          step = 0.5,
          value = NULL
        )
      ),

  ),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    tags$body(fluidRow(
      h5("Body Mass Index (BMI)", style = "text-align:left;
          color:black;
          font-weight:bold"),
      column(
        textOutput("bmi"),
        width = 2,
        style = "text-align:center;
          color:blue;
          font-weight:bold"
      )
    )
    
    ,
    fluidRow(
      br(),
      column(
        textOutput("category"),
        width = 2,
        style = "text-align:center;
          color:crimson;
          font-weight:bold"
      )
    ),
    fluidRow(
      br(),
     tags$div(
        style = "position: absolute; bottom: 0;",
        tags$p("Test")
        )
      )
    ,
    style = "background-color:powderblue")
  ))
))

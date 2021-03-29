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
  sidebarLayout(
    sidebarPanel(
      tags$p(
        "Enter your weight and height then press Enter or Tab to calculate your Body
              Mass Index (BMI):"
      ),
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
      ,
      conditionalPanel(
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
      tags$body(
        fluidRow(
        column(
          h5("Body Mass Index (BMI)", style = "text-align:center;
          color:black;
          font-weight:bold;
             font-size:20px"),
          br(),
          textOutput("bmi"),
          br(),
          textOutput("category"),
          width = 4,
          style = "text-align:center;
          color:blue;
          font-weight:bold;
          font-size:24px"
        ),
        column(
          offset = 1,
          h5("How is BMI interpreted?", style = "text-align:center;
          color:black;
          font-weight:bold"),
          tags$p(
            "For adults 20 years old and older,
        BMI is interpreted using standard weight status categories.
        These categories are the same for men and women of all body types and ages.
               The standard weight status categories associated with BMI
               ranges for adults are shown in the following table:"
          ),
          
          tags$table(
            id = "table5",
            class = "table table-bordered ",
            
            tags$thead(tags$tr(
              tags$th("BMI", scope = "col"),
              tags$th("Weight Status", scope =
                        "col")
            )),
            
            tags$tbody(
              tags$tr(tags$td("Below 18.5"), tags$td("Underweight")),
              tags$tr(tags$td("18.5 - 24.9"), tags$td("Normal or Healthy Weight"))
              ,
              tags$tr(tags$td("25.0 - 29.9"), tags$td("Overweight"))
              ,
              tags$tr(tags$td("30.0 and Above"), tags$td("Obese"))
            )
          )
          ,
          width = 6,
          style = "text-align:left;
          color:black;border: 1px solid grey;background-color:azure"
        )
      )
      ,
      style = "background-color:powderblue")
    )
  )
))

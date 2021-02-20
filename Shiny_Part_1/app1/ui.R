library(shiny)
shinyUI(fluidPage(
  titlePanel("Hello World!"),
  sidebarLayout(
    sidebarPanel(
      h1("Sidebar")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("This is the main panel")
    )
  )
))
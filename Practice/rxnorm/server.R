#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny);library(jsonlite);library(httr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$DDI <- renderText({
        rxname1 = input$Med1
        url1 <- paste0("https://rxnav.nlm.nih.gov/REST/Prescribe/rxcui?name=",rxname1)
        rxname2 = input$Med2
        url2 <- paste0("https://rxnav.nlm.nih.gov/REST/Prescribe/rxcui?name=",rxname2)
        res1 = GET(url1)
        data1 = fromJSON(rawToChar(res1$content))
        rxcui1 <- data1$idGroup$rxnormId
        res2 = GET(url2)
        data2 = fromJSON(rawToChar(res2$content))
        rxcui2 <- data2$idGroup$rxnormId
        med_string = paste0(rxcui1,sep = '+',rxcui2)
        url3 <- paste0("https://rxnav.nlm.nih.gov/REST/interaction/list.json?rxcuis=",med_string)
        res3 = GET(url3)
        data3 = fromJSON(rawToChar(res3$content))
        data3$fullInteractionTypeGroup$fullInteractionType
    })

})

library(dygraphs)
load("sustainabilityShiny.RData")

shinyServer(function(input, output) {
  
  output$dygraph <- renderDygraph({
    plotDict[[input$plotType]]
  })
})
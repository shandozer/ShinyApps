library(shiny)
suppressMessages(library(maps))
suppressMessages(library(mapproj))

source("helpers.R")
counties <- readRDS("data/counties.rds")
# server.R

shinyServer(
    function(input, output) {
        output$map <- renderPlot({
            data <- switch(input$var, 
                           "Percent White" = counties$white,
                           "Percent Black" = counties$black,
                           "Percent Hispanic" = counties$hispanic,
                           "Percent Asian" = counties$asian)
            
            color <- switch(input$var, 
                            "Percent White" = "darkturquoise",
                            "Percent Black" = "purple",
                            "Percent Hispanic" = "tan1",
                            "Percent Asian" = "tomato")
            
            percent_map(var = data, color = color, legend.title = paste("% ", input$var), max = input$range[2], min = input$range[1])
        })
    }
)
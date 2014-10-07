# server.R

library(shiny)
suppressMessages(library(maps))
suppressMessages(library(mapproj))
source("helpers.R")
counties <- readRDS("data/counties.rds")


shinyServer(
    function(input, output) {
        
        output$map <- renderPlot({
            
            data <- switch(input$var, 
                           "Percent White" = counties$white,
                           "Percent Black" = counties$black, 
                           "Percent Hispanic" = counties$hispanic,
                           "Percent Asian" = counties$asian)
            
            color <- switch(input$var, 
                            "Percent White" = "darkgreen",
                            "Percent Black" = "darkorange", 
                            "Percent Hispanic" = "darkviolet",
                            "Percent Asian" = "pink")
            
            legend <- switch(input$var,
                             "Percent White" = "% white",
                             "Percent Black" = "% Black", 
                             "Percent Hispanic" = "% Hispanic",
                             "Percent Asian" = "% Asian")
            
            percent_map(
                var = data, 
                color = color, 
                legend.title = paste('% ', input$var),
                max = input$range[2],
                min = input$range[1])
        })
        
    }
)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    output$text1 <- renderText({ 
        paste(input$num_barb, "Barbarians", 
              " at level ", input$barb_lvl,
              " will cost you: ", get_cost('barb', input$barb_lvl, input$num_barb), " Elixir")
    })
    output$text2 <- renderText({
        paste("Total Army Elixir Costs: ", sum(get_cost('barb', input$barb_lvl, input$num_barb), 
                                               get_cost('arch', input$arch_lvl, input$num_arch), 
                                               get_cost('gob', input$gob_lvl, input$num_gob), 
                                               get_cost('giant', input$giant_lvl, input$num_giant), 
                                               get_cost('breaker', input$wb_lvl, input$num_wb)
                                               )
        )
    })
})
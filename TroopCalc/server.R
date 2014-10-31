library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    output$barbcost <- renderText({ 
        paste(input$num_barb, "Barbarians", 
              " at level ", input$barb_lvl,
              " will cost you: ", get_cost('barb', input$barb_lvl, input$num_barb), " Elixir")
    })
    output$totalcost <- renderText({
        paste("Total Army Elixir Costs: ", sum(get_cost('barb', input$barb_lvl, input$num_barb), 
                                               get_cost('arch', input$arch_lvl, input$num_arch), 
                                               get_cost('gob', input$gob_lvl, input$num_gob), 
                                               get_cost('giant', input$giant_lvl, input$num_giant), 
                                               get_cost('wallbreaker', input$wb_lvl, input$num_wb),
                                               get_cost('dragon', input$drag_lvl, input$num_drag)
                                               )
        )
    })
    
    output$totalsize <- renderText({
        paste("Total army size: ", sum(input$num_barb,
                                       input$num_arch,
                                       input$num_gob,
                                       (input$num_giant * 5),
                                       (input$num_wb * 2),
                                       (input$num_drag * 20),
                                       (input$num_minion * 2)
                                       )
        )
    })
    
    output$archcost <- renderText({ 
        paste(input$num_arch, "Archers", 
              " at level ", input$arch_lvl,
              " will cost you: ", get_cost('arch', input$arch_lvl, input$num_arch), " Elixir")
    })
        
    output$gobcost <- renderText({ 
        paste(input$num_gob, "Goblins", 
              " at level ", input$gob_lvl,
              " will cost you: ", get_cost('gob', input$gob_lvl, input$num_gob), " Elixir")
    })
    
    output$giantcost <- renderText({ 
        paste(input$num_giant, "Giants", 
              " at level ", input$giant_lvl,
              " will cost you: ", get_cost('giant', input$giant_lvl, input$num_giant), " Elixir")
    })
    
    output$wbcost <- renderText({ 
        paste(input$num_wb, "Breakers", 
              " at level ", input$wb_lvl,
              " will cost you: ", get_cost('breaker', input$wb_lvl, input$num_wb), " Elixir")
    })
    
    output$dragcost <- renderText({ 
        paste(input$num_drag, "Dragons", 
              " at level ", input$drag_lvl,
              " will cost you: ", get_cost('dragon', input$drag_lvl, input$num_drag), " Elixir")
    })
})
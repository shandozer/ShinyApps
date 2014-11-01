library(shiny)
# server.R
# 
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    output$barbcost <- renderText({ 
        paste(input$num_barb, "Barbarians", 
              " at level ", input$barb_lvl,
              " will cost you: ", get_cost('barb', input$barb_lvl, input$num_barb), " Elixir")
    })
    output$totalelixir <- renderText({
        paste("Total Army Elixir Expenses: ", sum(get_cost('barb', input$barb_lvl, input$num_barb), 
                                               get_cost('arch', input$arch_lvl, input$num_arch), 
                                               get_cost('gob', input$gob_lvl, input$num_gob), 
                                               get_cost('giant', input$giant_lvl, input$num_giant),
                                               get_cost('wizard', input$wizard_lvl, input$num_wizard),
                                               get_cost('healer', input$healer_lvl, input$num_healer), 
                                               get_cost('wallbreaker', input$wb_lvl, input$num_wb),
                                               get_cost('dragon', input$drag_lvl, input$num_drag)
                                               )
        )
    })
    
    output$totaldark <- renderText({
        paste("Total Army Dark Elixir Expenses: ", get_cost('minion', input$minion_lvl, input$num_minion)) 
    })
    
    output$totalsize <- renderText({
        paste("Total army size: ", sum(input$num_barb,
                                       input$num_arch,
                                       input$num_gob,
                                       (input$num_giant * 5),
                                       (input$num_wizard * 4),
                                       (input$num_healer * 14),
                                       (input$num_wb * 2),  # add Wizards and healers here somehwere
                                       (input$num_drag * 20),
                                       (input$num_minion * 2)   # section for Dark Dudes, to be appended
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
    
    output$wizardcost <- renderText({ 
        paste(input$num_wizard, "Wizards", 
              " at level ", input$wizard_lvl,
              " will cost you: ", get_cost('wizard', input$wizard_lvl, input$num_wizard), " Elixir")
    })
    
    output$healercost <- renderText({
        paste(input$num_healer, "Healers",
              " at level ", input$healer_lvl,
              " will cost you: ", get_cost('healer', input$healer_lvl, input$num_healer), " Elixir")
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
    
    output$minioncost <- renderText({
        paste(input$num_minion, "Minions",
              "at level ", input$minion_lvl, 
              " will cost you: ", get_cost('minion', input$minion_lvl, input$num_minion), " Dark Elixir")
    })
})
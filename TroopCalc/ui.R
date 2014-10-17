library(shiny)
# ui.R
# 
VERSION = '1.0'

shinyUI(fluidPage(
#     titlePanel("TroopCalc"),
#     includeCSS("styles.css"),
    
    tags$head(
        tags$link(rel="stylesheet", type = "text/css", href="styles.css")),
    headerPanel("TroopCalc"),
    #titlePanel("Welcome to TroopCalc"),
        
    sidebarLayout(
    sidebarPanel(
        h3(helpText("Enter your information...")),
        fluidRow(
            column(3,
                   radioButtons("th", label = h5("Town Hall Level"),
                                choices = list("5" = 1, "6" = 2,
                                               "7" = 3, "8" = 4,
                                               "9" = 5, "10" = 6),
                                selected = 1)),
            column(3, 
                   radioButtons("lab", label = h5("Laboratory Level"),
                                choices = list("1" = 1, "2" = 2,
                                               "3" = 3, "4" = 4,
                                               "5" = 5, "6" = 6),
                                selected = 1)),
            column(3, 
                   radioButtons("spellfact", label = h5("Spell Factory Level"),
                                choices = list("1" = 1, "2" = 2,
                                               "3" = 3, "4" = 4,
                                               "5" = 5, "6" = 6),
                                selected = 1)),
            column(3, 
                   checkboxGroupInput("checkGroup", 
                                      label = h5("Army Camps"), 
                                      choices = list("Camp 1" = 1, 
                                                     "Camp 2" = 2, 
                                                     "Camp 3" = 3,
                                                     "Camp 4" = 4),
                                      selected = 1))
     )),

    mainPanel(
        fluidRow(

            column(3, 
                   sliderInput("barbs", label = h5("Add Barbarians"),
                               min = 0, max = 100, value = 0),  
                   br(),
                   sliderInput("arch", label = h5("Add Archers"),
                               min = 0, max = 100, value = 0),  
                   br(),
                   sliderInput("gobs", label = h5("Add Goblins"),
                               min = 0, max = 100, value = 0),  
                   br(),
                   sliderInput("giants", label = h5("Add Giants"),
                               min = 0, max = 100, value = 0),  
                   br(),  
                   sliderInput("wb", label = h5("Add Wall Breakers"),
                               min = 0, max = 100, value = 0)
                   ),
            
            column(3,
                   numericInput("barblvl", label = h5("Level"), 
                                value = 1,
                                min = 1,
                                max = 6),  
                   br(),
                   br(),
                   numericInput("archlvl", label = h5("Level"), 
                                value = 1,
                                min = 1,
                                max = 6), 
                   br(),
                   numericInput("goblvl", label = h5("Level"), 
                                value = 1,
                                min = 1,
                                max = 6),  
                   br(),
                   br(),
                   numericInput("giantlvl", label = h5("Level"), 
                                value = 1,
                                min = 1,
                                max = 6),  
                   br(),  
                   br(), 
                   numericInput("wblvl", label = h5("Level"), 
                                value = 1,
                                min = 1,
                                max = 6)
                   )
            
            )   
        )
    )
))
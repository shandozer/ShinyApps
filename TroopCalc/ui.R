library(shiny)
source("helpers.R")
# ui.R
# 
VERSION = '1.2'

shinyUI(fluidPage(title="TroopCalculator",
#     titlePanel("TroopCalc"),
#     includeCSS("styles.css"),
    
    tags$head(
        tags$link(rel="stylesheet", type = "text/css", href="bootstrap.css")),
    headerPanel(h1(paste("Welcome to TroopCalc", VERSION), align = "center")),
    #titlePanel("Welcome to TroopCalc"),
        
    sidebarLayout(
    sidebarPanel(
        h3(helpText("Enter some basic information...")),
        fluidRow(theme = "bootstrap.css",
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
                   checkboxGroupInput("army_group", 
                                      label = h4("Troops Available", align = "center"), 
                                      choices = list("Barbarians" = 1, 
                                                     "Archers" = 2, 
                                                     "Goblins" = 3,
                                                     "Giants" = 4,
                                                     "Wall Breakers" = 5,
                                                     "Wizards" = 6,
                                                     "Healers" = 7,
                                                     "Dragons" = 8,
                                                     "Pekka" = 9),
                                      selected = 1)),
            column(4,
                   radioButtons("barb_lvl", label = h4("Barbarians", align = "center", color = "black"),
                                choices = list("1" = 1, "2" = 2,
                                               "3" = 3, "4" = 4,
                                               "5" = 5, "6" = 6),
                                selected = 1, inline=T),
                   
                   radioButtons("arch_lvl", label = h4("Archers", align = "center"),
                                choices = list("1" = 1, "2" = 2,
                                               "3" = 3, "4" = 4,
                                               "5" = 5, "6" = 6),
                                selected = 1, inline=T),
                   
                   radioButtons("gob_lvl", label = h4("Goblins", align = "center"),
                                choices = list("1" = 1, "2" = 2,
                                               "3" = 3, "4" = 4,
                                               "5" = 5, "6" = 6),
                                selected = 1, inline=T)
                   )
        ),
        br(),
        hr(),
        h4("Compose an army", align = "center"),
        fluidRow(
            
            column(3, 
                   sliderInput("num_wb", label = h5("Wall Breakers"),
                               min = 0, max = 14, value = 4, step = 1)
                   ),
            
            column(3, 
                  
                   sliderInput("num_barb", label = h5("Barbarians"),
                               min = 0, max = 200, value = 40),  
               
                   sliderInput("num_arch", label = h5("Archers"),
                               min = 0, max = 200, value = 60),  
              
                   sliderInput("num_gob", label = h5("Goblins"),
                               min = 0, max = 200, value = 30),  
              
                   sliderInput("num_giant", label = h5("Giants"),
                               min = 0, max = 40, value = 4)
                   ),
            
            column(3, 
                   sliderInput("num_mins", label = h5("Minions"),
                               min = 0,  max = 100, value = 0)
                   )
        
            )   
        )
    )
))
library(shiny)
source("helpers.R")
# ui.R
# 
VERSION = '1.3'

shinyUI(fluidPage(title="TroopCalculator",
#     titlePanel("TroopCalc"),
#     includeCSS("styles.css"),
    
    tags$head(
        tags$link(rel="stylesheet", type = "text/css", href="bootstrap.css")),
        headerPanel(h1(paste("Welcome to TroopCalc", VERSION), align = "center")),
    #titlePanel("Welcome to TroopCalc"),
        sidebarLayout(position="right",
            sidebarPanel(
                                radioButtons("barb_lvl", label = h4("Barbarians", align = "center", color = "black"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("arch_lvl", label = h4("Archers", align = "center"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("gob_lvl", label = h4("Goblins", align = "center"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("giant_lvl", label = h4("Giants", align = "center"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("wb_lvl", label = h4("Breakers", align = "center"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("drag_lvl", label = h4("Dragons", align = "center"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4),
                                             selected = 2, inline=T)
                         
                     ),
        mainPanel(
            h3(helpText("Compose an army", align = "center")),
            fluidRow(
                
                column(4, 
                       
                       
                       sliderInput("num_barb", label = h5("Barbarians"),
                                   min = 0, max = 200, value = 44),  
                       
                       sliderInput("num_arch", label = h5("Archers"),
                                   min = 0, max = 200, value = 60),  
                       
                       sliderInput("num_gob", label = h5("Goblins"),
                                   min = 0, max = 200, value = 40),  
                       
                       sliderInput("num_giant", label = h5("Giants"),
                                   min = 0, max = 40, value = 8)
                ),
                
                column(3, 
                       sliderInput("num_wb", label = h5("Wall Breakers"),
                                   min = 0, max = 14, value = 8, step = 1),
                       sliderInput("num_minion", label = h5("Minions"),
                                   min = 0,  max = 100, value = 0),
                       sliderInput("num_drag", label = h5("Dragons"),
                                   min = 0, max = 10, value = 0)
                )
            ),
            
        fluidRow(        
            column(5,
                   h3(helpText("Troop Costs", align= "center")),
                   h5(textOutput("barbcost")),
                   h5(textOutput("archcost")),
                   h5(textOutput("gobcost")),
                   h5(textOutput("giantcost")),
                   h5(textOutput("wbcost")),
                   h5(textOutput("dragcost"))
                ),
            column(5, 
                    h3(helpText("Army Totals", align= "left")),
                    h5(textOutput("totalcost")),
                    h5(textOutput("totalsize"))
                )
            )
        )
    )
)
)
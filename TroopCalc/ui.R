library(shiny)
source("helpers.R")
# ui.R
# 
VERSION = '1.3.2'
MAJOR_VERSION = strtrim(VERSION,3)

shinyUI(fluidPage(title="TroopCalculator",
#     titlePanel("TroopCalc"),
#     includeCSS("styles.css"),
    
    tags$head(
        tags$link(rel="stylesheet", type = "text/css", href="bootstrap.css")),
        headerPanel(h1(paste("Welcome to TroopCalc", MAJOR_VERSION), align = "center")),
    #titlePanel("Welcome to TroopCalc"),
        sidebarLayout(position="right",
            
            sidebarPanel(width=3,
                h3(helpText("Select Troop Levels", align="center")),
                                radioButtons("barb_lvl", label = h4("Barbarians", color = "black"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("arch_lvl", label = h4("Archers"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("gob_lvl", label = h4("Goblins"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                                
                                radioButtons("giant_lvl", label = h4("Giants"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" = 6),
                                             selected = 4, inline=T),
                
                                radioButtons("wizard_lvl", label = h4("Wizards"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5, "6" =6),
                                             selected = 4, inline=T),
                                
                                radioButtons("healer_lvl", label = h4("Healers"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5),
                                             selected = 2, inline=T),
                                
                                radioButtons("wb_lvl", label = h4("Breakers"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5),
                                             selected = 4, inline=T),
                                
                                radioButtons("minion_lvl", label = h4("Minions"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4,
                                                            "5" = 5),
                                             selected = 2, inline=T),
                                
                                radioButtons("drag_lvl", label = h4("Dragons"),
                                             choices = list("1" = 1, "2" = 2,
                                                            "3" = 3, "4" = 4),
                                             selected = 2, inline=T)
                         
                     ),
        mainPanel(
            h3(helpText("Build An Army", align = "center")),
            fluidRow(
                
                column(4, 
                       
                       
                       sliderInput("num_barb", label = h5("Barbarians"),
                                   min = 0, max = 200, value = 44),  
                       
                       sliderInput("num_arch", label = h5("Archers"),
                                   min = 0, max = 200, value = 60),  
                       
                       sliderInput("num_gob", label = h5("Goblins"),
                                   min = 0, max = 200, value = 40),  
                       
                       sliderInput("num_minion", label = h5("Minions"),
                                   min = 0,  max = 100, value = 0)
                       
                ),
                
                column(4, 
                       sliderInput("num_giant", label = h5("Giants"),
                                   min = 0, max = 40, value = 8),
                       
                       sliderInput("num_wizard", label=h5("Wizards"),
                                   min = 0, max = 50, value = 0, step = 1),
                       
                       sliderInput("num_healer", label = h5("Healers"),
                                   min = 0, max = 5, value = 0, step =1),
                       
                       sliderInput("num_wb", label = h5("Wall Breakers"),
                                   min = 0, max = 14, value = 8, step = 1)
                       
                      
                ),
                
                column(3, 
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
                   h5(textOutput("wizardcost")),
                   h5(textOutput("healercost")),
                   h5(textOutput("wbcost")),
                   h5(textOutput("dragcost")),
                   h5(textOutput("minioncost"))
                ),
            column(4, 
                    h3(helpText("Army Totals", align= "left")),
                    h5(textOutput("totalelixir")),
                    h5(textOutput("totaldark")),
                    h5(textOutput("totalsize")),
                   br(),
                   h3(helpText("Spell Totals", align="left"))
                   
                ),
            
            column(3,
                  h4(helpText("Add Spells")),
                  selectInput("lightlvl", label = h6("Lightning Level"), 
                              choices = list("N/A" = NA ,"1" = 1, 
                                             "2" = 2, "3" = 3, "4" = 4,
                                             "5" = 5), selected = 0),
                  numericInput("num_lightnings", label = h6("Add Lightning"), value=0, min=0, max=5),
                  
                  selectInput("healvll", label = h6("Heal Level"), 
                              choices = list("N/A" = NA ,"1" = 1, 
                                             "2" = 2, "3" = 3, "4" = 4,
                                             "5" = 5), selected = 0),
                  
                  selectInput("ragelvl", label = h6("Rage Level"), 
                              choices = list("N/A" = NA ,"1" = 1, 
                                             "2" = 2, "3" = 3, "4" = 4,
                                             "5" = 5), selected = 0),
                  
                  selectInput("jumplvl", label = h6("Jump Level"), 
                              choices = list("N/A" = NA ,"1" = 1, 
                                             "2" = 2, "3" = 3, "4" = 4,
                                             "5" = 5), selected = 0)
                  )
                   
                )
            )
        )
    )
)

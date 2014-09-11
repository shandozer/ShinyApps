# ui.R

shinyUI(fluidPage(
    titlePanel("censusVis"),
    sidebarLayout(
    sidebarPanel(
        helpText("Create demographic maps with information from 2010 US Census."),

        selectInput("var", label = "Choose a variable to display", 
                   choices = list("Percent White" = 1, "Percent Black" = 2,
                                  "Percent Hispanic" = 3, "Percent Asian" = 4), selected = 1),

        sliderInput("range", "Range of interest:",
                   min = 0, max = 100, value = c(0, 100))
        
        ),
    mainPanel()
    )
    ))
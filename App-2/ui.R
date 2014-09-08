library(shiny)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Exploring UI.R and HTML5 stuff"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(#position="right",
        sidebarPanel( "sidebar panel title"),
        mainPanel(
                  h1("First Title Level"),
                  h2("Second Title Level"),
                  h3("Third Title Level", align="center"),
                  h4("Fourth Title Level"),
                  h5("Fifth Title Level"),
                  h6("Sixth Title Level")
        )
    )
))
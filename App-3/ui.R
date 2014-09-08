library(shiny)

shinyUI(fluidPage(
    titlePanel("My Shiny App"),
    sidebarLayout(
        sidebarPanel(
                    h2("Installation"), 
                     p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
                     code('install.packages("shiny")'),
                     br(),br(),br(),
                     p(
                        img(src = 'bigorb.png', height=50, width=50, position='left'), "shiny is a product of ",
                        span("RStudo", style = "color:blue")
                     )
                     ),
        mainPanel(
            h1("Introducing Shiny"),
            p("Shiny is a new package from RStudio that makes it", 
              em(" incredibly"), 
              " easy to build interactive web applications with R."),
            br(),
            p("For an introduction and live examples, visit the ", 
              a(href="www.shiny.rstudio.com/tutorial", "Shiny homepage.")
            ),
            br(),
            h3("Features"), 
            tags$div(
                tags$ul(
                    tags$li("Build useful web applications with only a few lines of code--no JavaScript required."),
                    tags$li("Shiny applications are automatically 'live' in the same way that", 
                        strong(" spreadsheets "), 
                        "are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.")
                    )
                )
        )
    )
))
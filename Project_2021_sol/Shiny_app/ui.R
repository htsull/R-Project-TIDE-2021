

header <- dashboardHeader(title = "Movies Database", 
                          tags$li(class="dropdown",tags$a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial", icon("github"), "Source Code", target="_blank"))
                          )






sidebar <- dashboardSidebar(disable = T)

body <- dashboardBody(
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "styling.css")
    ),
    
    fluidRow(
        column(4, 
               selectInput("decade", 
                              label = "Choose decade", 
                              choices = decade_val,
                              selected = "2010 - 2020"
                              ),
               selectInput("language",
                           label = "Choose language below",
                           choices = ""
                           ),
               selectInput("title",
                           label = "Choose title below",
                           choices = ""
                           )
               ),
        column(8,
               tableOutput("test")
               )
               

        )

        )


ui<-dashboardPage(header, sidebar, body)
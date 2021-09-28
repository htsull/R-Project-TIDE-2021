




header <- dashboardHeader(title = "Movies Database", 
                          tags$li(class="dropdown",tags$a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial", icon("github"), "Source Code", target="_blank"))
                          )

sidebar <- dashboardSidebar(disable = T)

body <- dashboardBody(

    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css")
    ),
    
    
    fluidRow(
        column(3, 
               selectInput("decade", 
                              label = "Choose decade", 
                              choices = decade_val,
                              selected = NULL
                              ),
               # selectInput("a_d",
               #             label = "A - D",
               #             choices= ""),
               selectInput("title",
                           label = "Choose title below",
                           choices = ""
                           ),
               textOutput("founds"
                          ),
               actionButton("submit",
                            label = "Submit",
                        icon = icon('angle-right',lib = 'font-awesome')
                        ),
               textOutput("test")
               ),
        column(9,
               uiOutput("filtered_table")
               )
               

        )

)


ui<-dashboardPage(header, sidebar, body)
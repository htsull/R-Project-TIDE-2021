# Shiny dashboard project
# TIDE 2021-2022
# Par Berthony Sully et Clément Landy


# Define dashboardHeader()
header <- dashboardHeader(title = "Movies Database",
                          tags$li(class="dropdown",
                                  tags$a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial", 
                                         icon("github"), 
                                         "Source Code", 
                                         target="_blank"),
                                  tags$li(class="dropdown",
                                  tags$a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial", 
                                         icon("github"), 
                                         "Source Code", 
                                         target="_blank")
                                  )
                                )
                          )
                         
# Define dashboardSidebar()
sidebar <- dashboardSidebar(
  sidebarMenu(
        menuItem("Movies Infos", tabName = "movies_infos", icon = icon("film"),
                 badgeLabel =icon("info-circle"), badgeColor = "light-blue"),
        menuItem("Data Table", icon = icon("th"), tabName = "data_table",
                 badgeLabel =icon("database"), badgeColor = "light-blue"),
        menuItem("Hall of Fame", icon = icon("trophy"), tabName = "hall_of_fame", 
             badgeLabel =icon("sort-amount-up"), badgeColor = "light-blue")
              )
)

# Define dashboardBody()
body <- dashboardBody(
  

    # head links tag for css stylesheet
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css"),
        tags$style("tfoot {display: table-header-group;}")
    ),
    
    tabItems(
      tabItem("movies_infos",
      # Row srtucture
      fluidRow(
        column(3,
               # Define User inputs
               selectInput("decade", 
                              label = "Choose decade", 
                              choices = decade_val,
                              selected = NULL),
               
               selectInput("title",
                           label = "Choose title below",
                           choices = ""),
               textOutput("founds"),
               ),
        
        column(9,
               uiOutput("filtered_table")
               )
        )
    ),

tabItem("data_table",
    fluidPage(
        fluidRow(dataTableOutput("data_view")
              )
    )
        ),

tabItem("hall_of_fame")
      )
)

# ui out to server
ui<-dashboardPage(header, sidebar, body)



################################################################################


    # footer = dashboardFooter(
    #     left = "By Divad Nojnarg",
    #     right = "Zurich, 2019"
    #     )

               # selectInput("language",
               #             label = "Choose language",
               #             choices= c("All",testLang)
               #             ),


               # actionButton("submit",
               #              label = "Submit",
               #          icon = icon('angle-right',lib = 'font-awesome')
               #          ),
               # textOutput("test")



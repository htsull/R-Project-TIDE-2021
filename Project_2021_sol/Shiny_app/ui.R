# Shiny dashboard project
# TIDE 2021-2022
# Par Berthony Sully et Landy Clément 

# global option for sipnners
options(spinner.color="#0275D8", spinner.color.background="#ffffff", spinner.size=2)


# Define dashboardHeader()
header <- dashboardHeader(title =  "Movie Database",
                          
                          tags$li(class="dropdown",
                                  tags$a(href="https://github.com/htsull/R-Project-TIDE-2021/tree/main/Project_2021_sol/Shiny_app", 
                                         icon("github"), 
                                         "Source Code", 
                                         target="_blank")
                                )
                          
                          )
                         
                          
# Define dashboardSidebar()
sidebar <- dashboardSidebar(minified = F, collapsed = TRUE,
  sidebarMenu(
        menuItem("Movies Infos", tabName = "movies_infos", icon = icon("film"),
                 badgeLabel =icon("info-circle"), badgeColor = "light-blue"),
        menuItem("Data Table", icon = icon("th"), tabName = "data_table",
                 badgeLabel =icon("database"), badgeColor = "light-blue"),
        menuItem("Hall of Fame", icon = icon("trophy"), tabName = "hall_of_fame", 
             badgeLabel =icon("sort-amount-up"), badgeColor = "light-blue"),
        menuItem("DataViz", icon = icon("eye"), tabName = "data_viz", 
             badgeLabel =icon("chart-bar"), badgeColor = "light-blue")
              )
)



# Define dashboardBody()
body <- dashboardBody(
  
  # Found at https://stackoverflow.com/questions/40985684/r-shiny-present-a-shinybs-modal-popup-on-page-visit-no-user-action
  bsModalNoClose("window", "Window",
                 title="Project Details", size="large",
                 h4("English", align = "justify"),
                 h5(description_eng, align = "justify"),
                 # h4("", align = "justify"),
                 h4("French", align = "justify"),
                 h5(description_fr, align = "justify"),
                 # footer = h4(actionLink('create_account',),align='center'),
                 tags$head(tags$style("#window .modal-footer{display:bloc}
                                       .modal-header .close{display:none}"),
                           tags$script("$(document).ready(function(){
                                        $('#window').modal();
                                        });")
                 )),

  
    # head links tag for css stylesheet
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "stylesheet.css"),
    tags$style("tfoot {display: table-header-group;}"),
    tags$link(rel="stylesheet", type="text/css", href="style.css"),
    tags$link(rel="stylesheet",
              href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css",
              integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p",
              crossorigin="anonymous")
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
                              selected = NULL
                              ),
               
               selectInput("title",
                           label = "Choose title below",
                           choices = ""
                           ),
               
               textOutput("founds"),
               
               ),
        
        
        column(9,
               uiOutput("filtered_table") %>% withSpinner(type = 6)
               )
               
        )

),

tabItem("data_table",
    fluidPage(
      fluidRow(
        column(4,
               selectInput("tab_fil1",
                           label = "Filter Select",
                           choices = c("Country","Language", "Genre")
               )
        ),
        
        column(4,
               selectInput("tab_fil2",
                           label = "",
                           choices = "")
        ),
        column(4,
               numericInput("tab_fil3",
                            label = "Number of observations",
                            min = 0,
                            max = Inf,
                            value = 50
               )
        )
      ),
      textOutput("founds2"),
      dataTableOutput("data_view") %>%  withSpinner(type = 6)
    )
        ),

tabItem("hall_of_fame",
        fluidPage(
          fluidRow(
            column(6,
                   selectInput("HOF_fil1",
                               label = "Select filter below",
                               choices = c("Decade", "Genre", "Year")
                   )
            ), 
            column(6,
                   selectInput("HOF_fil2",
                               label = "",
                               choices = "")
            )
          ),
          fluidRow(
            uiOutput("podium_table")
          )
        )
),
tabItem("data_viz",
        fluidPage(
          fluidRow(
            column(6,
                   
                   pickerInput(
                     inputId = "dec_fil1",
                     label = "Select decade below",
                     choices = decade_val,
                     multiple = FALSE,
                     choicesOpt = list(
                       disabled = decade_val %in% decade_val[1:2]
                     )
                     )
          ),
          column(6,
                 verbatimTextOutput("cont")
                 )
          ),
          fluidRow(
            plotOutput("countTitleGraph",width = "70%") %>%  withSpinner(type = 6)
          )
        )
)
        )
    )

footer = dashboardFooter(
  left = "By Berthony Sully",
  right = "Paris 1 Panthéon-Sorbonne, TIDE 2021-2022"
)


# ui out to server
ui<-dashboardPage(header, sidebar, body, footer=footer)



################################################################################



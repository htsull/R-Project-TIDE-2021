server <- function(input, output, session) {
  
  observeEvent(
    input$decade,
    updateSelectInput(session,
                      inputId = "title",
                      label = "Choose the title below",
                      choices = titleChoices()
                      )
    )
  
  titleChoices <- reactive({
  
    data_$title[data_$decade == input$decade] %>% sort
    
  })
  



# filtering data and rendering to htmlTable
  output$filtered_table <- renderUI({
    
    table(original_title = input$title,
          
          year = data_$year[data_$decade == input$decade & data_$title == input$title],
          
          director = data_$director[data_$decade == input$decade & data_$title == input$title],
          
          genre = data_$genre[data_$decade == input$decade & data_$title == input$title],
          
          writer = data_$writer[data_$decade == input$decade & data_$title == input$title],
          
          duration = data_$duration[data_$decade == input$decade & data_$title == input$title],
          
          production_company = data_$production_company[data_$decade == input$decade & data_$title == input$title],
          
          country = data_$country[data_$decade == input$decade & data_$title == input$title],
          
          actors = data_$actors[data_$decade == input$decade & data_$title == input$title],
          
          language = data_$language[data_$decade == input$decade & data_$title == input$title],
          
          avg_vote = data_$avg_vote[data_$decade == input$decade & data_$title == input$title],
          
          budget = data_$budget[data_$decade == input$decade & data_$title == input$title],
          
          description = data_$description[data_$decade == input$decade & data_$title == input$title]
          )
  })

# output of the findings length afer user input filter
  output$founds <- reactive({
    
    paste(data_$title[data_$decade == input$decade] %>% length(), "result(s) found")
    
  })
  
out <-  data_ %>% 
    select(Title = original_title,
           Genre = genre,
           Duration = duration,
           Country = country,
           Language = language,
           Director = director,
           Writer = writer,
           ` Prod. Company` = production_company) %>% head()
  
  output$data_view <- renderDataTable(
    out,
    options = list(pageLength = 20, 
                   lengthChange = FALSE,
                   autoWidth = TRUE,
                   searching= T
                   )
  )
  
  

}

#####################################################################






# titleChoices <- reactive({
#   data_$title[data_$decade == input$decade & str_detect(data_$language, input$language)]
# })


# observeEvent(
#   input$decade,
#   updateSelectInput(session,
#                     inputId = "language",
#                     label = "Language",
#                     choices = uniLang())
#   )
# 


#to use fo language filter
# testLang <- data_$language[grepl("French", data_$language)] %>%
#   paste(collapse = ',') %>%
#   strsplit(",")
# testLang <- testLang[[1]] %>% 
#   unique %>% sort() %>%  as.list()




# dashboardFooter <- function(left = NULL, right = NULL) {
#   htmltools::tags$footer(
#     class = "main-footer",
#     shiny::tags$div(class = "pull-right hidden-xs", right),
#     left
#     )
# 
#   }

# 
# filter_data <- function(x){
#   eval(parse("data_$",x,"[data_$decade == input$decade & data_$title == input$title]")) 
# }


# slice_choices <- reactive({
#   data_$title[data_$decade == input$decade] %>% filter(contains("a"))
# })
# 
# observeEvent(
#   input$decade,
#   updateSelectInput(session,
#                     inputId = "a_d",
#                     label = "A_D",
#                     choices = slice_choices()
#                     )
# )

# 
# testServer <- eventReactive(input$submit, {
#   paste("click")
# })
# 
# output$test <- reactive({
#   testServer()
#   
# })
# 
# observe({
#   if (input$choose_tab == "Automatic") {
#     output$test <- renderUI({
#       plotOutput("plot1", height = 250)
#     })
#   }
#   else if(input$choose_tab == "Manual") {
#     output$test <- renderUI({
#       plotOutput("plot2", height = 250, click = "plot_click")
#     })
#   }
# })

  
  
  # 
  # filter_by <- reactive({
  #   if(tolower(input$tab_fil1) == "actor"){
  #     lang1 <- data_$actors
  #     lang2 <- paste(lang1, collapse = ',')
  #     lang3 <- strsplit(lang2, ",")
  #     lang4 <- lang3[[1]] %>% unique %>% sort() %>%  as.list()
  #     return(lang4)
  #     
  #   }else if(tolower(input$tab_fil1) == "language"){
  #     lang1 <- data_$language[grepl(input$tab_fil1, data_$language)]
  #     lang2 <- paste(lang1, collapse = ',')
  #     lang3 <- strsplit(lang2, ",")
  #     lang4 <- lang3[[1]] %>% unique %>% sort() %>%  as.list()
  #     return(lang4) 
  #     
  #   }else if(tolower(input$tab_fil1) == "genre"){
  #     lang1 <- data_$genre[grepl(input$tab_fil1, data_$genre)]
  #     lang2 <- paste(lang1, collapse = ',')
  #     lang3 <- strsplit(lang2, ",")
  #     lang4 <- lang3[[1]] %>% unique %>% sort() %>%  as.list()
  #     return(lang4)      
  #   }
  #   
  # })
  
  
  

    # 
  # data_$original_title[grepl('Action', data_$genre)] %>% length()
  # 
  # data_$actors[grepl(input$tab_fil1, data_$actors)]
  
  # observeEvent(
  #   input$tab_fil1,
  #   updateSelectInput(session,
  #                     inputId = "tab_fil2",
  #                     label = paste("Choose the", tolower(input$tab_fil1) ,"below"),
  #                     choices = filter_by()
  #   )
  # )
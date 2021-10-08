server <- function(input, output, session) {

# observeEvent(
#   input$decade,
#   updateSelectInput(session,
#                     inputId = "language",
#                     label = "Language",
#                     choices = uniLang())
#   )
# 
# uniLang <- reactive({
#   lang1 <- data_$language[data_$decade == input$decade]
#   lang2 <- paste(lang1, collapse = ',')
#   lang3 <- strsplit(lang2, ",")
#   lang4 <- lang3[[1]] %>% unique %>% sort() %>%  as.list()
# })
#   
# 

  
  
  

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

# titleChoices <- reactive({
#   data_$title[data_$decade == input$decade & str_detect(data_$language, input$language)]
# })

filter_data <- function(x){
  eval(parse("data_$",x,"[data_$decade == input$decade & data_$title == input$title]")) 
}

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

output$founds <- reactive({
  paste(data_$title[data_$decade == input$decade] %>% length(), "result(s) found")
})

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


testServer <- eventReactive(input$submit, {
  paste("click")
})

output$test <- reactive({
  testServer()
  
})

}

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

  
  
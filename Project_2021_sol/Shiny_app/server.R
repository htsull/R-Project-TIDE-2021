server <- function(input, output, session) {

observeEvent(
  input$decade,
  updateSelectInput(session,
                    inputId = "language",
                    label = "Language",
                    choices = uniLang())
  )

uniLang <- reactive({
  lang1 <- data_$language[data_$decade == input$decade]
  lang2 <- paste(lang1, collapse = ',')
  lang3 <- strsplit(lang2, ",")
  lang4 <- lang3[[1]] %>% unique %>% sort() %>%  as.list()
})
  

observeEvent(
  input$language,
  updateSelectInput(session,
                    inputId = "title",
                    label = "Title",
                    choices = titleChoices()
                    )
)

titleChoices <- reactive({
  data_$title[data_$decade == input$decade & str_detect(data_$language, input$language)]
})


output$test <- renderTable({
  # Define the start and end dates for the data range
  start_date <- "2010-06-07"
  end_date <- "2010-06-14"
  
  # Create a gt table based on preprocessed
  # `sp500` table data
  sp500 %>%
    filter(date >= start_date & date <= end_date) %>%
    select(-adj_close) %>%
    gt() %>%
    tab_header(
      title = "S&P 500",
      subtitle = glue::glue("{start_date} to {end_date}")
    ) %>%
    fmt_date(
      columns = date,
      date_style = 3
    ) %>%
    fmt_currency(
      columns = c(open, high, low, close),
      currency = "USD"
    ) %>%
    fmt_number(
      columns = volume,
      suffixing = TRUE
    )
})


}




  
  
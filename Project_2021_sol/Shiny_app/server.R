server <- function(input, output, session) {
  
  toggleModal(session, "startupModal", toggle = "open")
  
  
  
  
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
           ` Prod. Company` = production_company) %>% 
    head(50)
  
output$data_view <- DT::renderDataTable(
  
  if(tolower(input$tab_fil1) == "language"){
    data_view_out[grepl(input$tab_fil2, data_view_out$Language), ]%>% head(input$tab_fil3) 
  } else if(tolower(input$tab_fil1) == "genre"){
    data_view_out[grepl(input$tab_fil2, data_view_out$Genre), ]  %>% head(input$tab_fil3) 
  } else if(tolower(input$tab_fil1) == "country"){
    data_view_out[grepl(input$tab_fil2, data_view_out$Country), ]  %>% head(input$tab_fil3) 
  } ,
  
  
  filter = "none",
  
  options = list(pageLength = 20, 
                 lengthChange = FALSE,
                 autoWidth = TRUE,
                 searching= T
                 # dom = "t"
  )
)


data_view_out <- data_ %>% 
  select(Title = original_title,
         Genre = genre,
         Actors = actors,
         Duration = duration,
         Country = country,
         Language = language,
         Director = director,
         Writer = writer,
         `Prod. Company` = production_company) 
  
  output$founds2 <- reactive({
    
    if(tolower(input$tab_fil1) == "language"){
      paste(data_view_out[grepl(input$tab_fil2, data_view_out$Language), ] %>% nrow(), "result(s) found") 
    } else if(tolower(input$tab_fil1) == "genre"){
      paste(data_view_out[grepl(input$tab_fil2, data_view_out$Genre),]   %>% nrow(), "result(s) found")
    } else if(tolower(input$tab_fil1) == "country"){
      paste(data_view_out[grepl(input$tab_fil2, data_view_out$Country),]   %>% nrow(), "result(s) found")
    } 
    
  })
  
   
  observeEvent(
    input$tab_fil1,
    updateSelectInput(session,
                      inputId = "tab_fil2",
                      label = paste("Choose the", tolower(input$tab_fil1) ,"below"),
                      choices = c(testChoices())
    )
  )
  
  #conditional choices for the filter (data table page)
  testChoices <- reactive({
    if(tolower(input$tab_fil1) == "language"){
      uni_(data_$language)
    } else if(tolower(input$tab_fil1) == "country"){
      uni_(data_$country)     
    } else if(tolower(input$tab_fil1) == "genre"){
      uni_(data_$genre)     
    }
  })
  
  observeEvent(
    input$HOF_fil1,
    updateSelectInput(session,
                      inputId = "HOF_fil2",
                      label = paste("Choose the", tolower(input$HOF_fil1) ,"below"),
                      choices = choicesHOF()
    )
  )
  
  choicesHOF <- reactive({
    if(tolower(input$HOF_fil1) == "decade"){
      uni_(data_$decade)
    } else if(tolower(input$HOF_fil1) == "year"){
      uniyear()
    } else if(tolower(input$HOF_fil1) == "genre"){
      uni_(data_$genre)
    }
  })
  
  
  # function to filter choices and render unique values
  uni_ <- function(data){
    data %>%
      strsplit(., ", ") %>% 
      unlist %>% 
      unique %>% 
      sort
  }
  
  # uniyear filter
  uniyear <- reactive({
    data_$year %>% unique() %>% sort
  })
  
  fil_decade <- reactive({
    data_ %>%
      select(original_title, decade, year, genre, avg_vote) %>%
      filter(., grepl(input$HOF_fil2, data_$decade)) %>% 
      arrange(desc(avg_vote)) %>%
      head(3)
  })
  
  fil_year <- reactive({
    data_ %>%
      select(original_title, decade, year, genre, avg_vote) %>%
      filter(., grepl(input$HOF_fil2, data_$year)) %>% 
      arrange(desc(avg_vote)) %>%
      head(3)
  })
  
  
  fil_genre <- reactive({
    data_ %>%
      select(original_title, decade, year, genre, avg_vote) %>%
      filter(., grepl(input$HOF_fil2, data_$genre)) %>% 
      arrange(desc(avg_vote)) %>%
      head(3)
  })
  
  
  output$podium_table <- renderUI({
    
    if(tolower(input$HOF_fil1) == "decade"){
      table2(original_title1 = fil_decade()[1,1],
             original_title2 = fil_decade()[2,1],
             original_title3 = fil_decade()[3,1],
             year1 = fil_decade()[1,3],
             year2 = fil_decade()[2,3],
             year3 = fil_decade()[3,3],
             avg_vote1 = fil_decade()[1,5],
             avg_vote2 = fil_decade()[2,5],
             avg_vote3 = fil_decade()[3,5])
    } else if(tolower(input$HOF_fil1) == "year"){
      table2(original_title1 = fil_year()[1,1],
             original_title2 = fil_year()[2,1],
             original_title3 = fil_year()[3,1],
             year1 = fil_year()[1,3],
             year2 = fil_year()[2,3],
             year3 = fil_year()[3,3],
             avg_vote1 = fil_year()[1,5],
             avg_vote2 = fil_year()[2,5],
             avg_vote3 = fil_year()[3,5])
    }else if(tolower(input$HOF_fil1) == "genre"){
      table2(original_title1 = fil_genre()[1,1],
             original_title2 = fil_genre()[2,1],
             original_title3 = fil_genre()[3,1],
             year1 = fil_genre()[1,3],
             year2 = fil_genre()[2,3],
             year3 = fil_genre()[3,3],
             avg_vote1 = fil_genre()[1,5],
             avg_vote2 = fil_genre()[2,5],
             avg_vote3 = fil_genre()[3,5])     
    }
    
  })
  
 
  output$countTitleGraph <- renderPlot({
    years <- data_[data_$decade == input$dec_fil1,]
    
    ggplot(years, aes(x=year))+
      geom_bar(aes(y=..count..))+
      xlab("Year") + ylab("Count")+
      scale_y_continuous(n.breaks = 10) +
      scale_x_continuous(n.breaks = 10)+
      geom_text(aes(label = ..count..), stat = "count", 
                vjust = 1.5, colour = "white")
  })
  output$cont <- renderText("There is only one film published in the first two decades each")

}

#####################################################################

  
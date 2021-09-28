path_ <- "C:/Users/bsully/OneDrive - Université Paris 1 Panthéon-Sorbonne/Documents/GitHub/R-Project-TIDE-2021/Project_2021_sol/Shiny_app/TIDE-2021-Shiny/data_shiny.csv"
shiny_data <- read.csv(path_, header = T, sep = ",")

df <- shiny_data[1:3,]

lst <- unique(df$actors)

actors_ <- paste(lst, collapse = '')

act_lst <- strsplit(actors_, ",")

a<- act_lst[[1]] %>% unique %>% as.list()
b<- a[a != "Blanche Bayliss"]

# finLst <- unlist(act_lst[[1]], recursive = T)

shiny_data$title[(shiny_data$decade == "1910 - 1920") & (shiny_data$language == "English")]

shiny_data %>% filter(decade == "1910 - 1920" & language == "English") %>% select(title, language, decade) %>% head

# %>% strsplit(",") %>% as.data.frame %>% unique

shiny_data %>% select(title, language) %>% str_detect(language, "French|.French.")

shiny_data$title[shiny_data$decade == "1910 - 1920" & str_detect(shiny_data$language, "French|.French.")]


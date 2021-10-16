source("req_packages.R")
source("home_table.R")
source("podium.R")

path_ <- "./data_shiny_useable.csv"
data_ <- read.csv(file = path_, sep = ",", header = T, encoding = "uft-8")


decade_val <- unique(data_$decade) %>%  sort %>% as.list
data_$language[data_$language == "None"] <- NA


bsModalNoClose <-function(...) {
  b = bsModal(...)
  b[[2]]$`data-backdrop` = "static"
  b[[2]]$`data-keyboard` = "false"
  return(b)
}

description <- "This Shiny application was created as part of a school project by Berthony Sully and Landy Clément as an evaluation for the R programming bootcamp. 
Due to the time constraints, we could not optimize the code and make the user experience as good as possible. The use of the code and resources is free and feel free 
to propose improvements on GitHub. The repo link is on the top right of the main page. Thanks already."



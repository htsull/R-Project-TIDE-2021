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

description_eng <- "This Shiny application was created as part of a school project by Berthony Sully and Landy Clément as an
evaluation for the R programming course. 

This application that we propose allows to make a simple visualization of data. 
In particular, it allows to filter the tables by criteria that we have deemed relevant and 
also allows to have a view on the evolution of the cinema industry according to the number 
of films released per year or per decade. 

Due to time constraints, we could not optimize the code and reduce the execution time but we 
made the user experience as good as possible. Use of the code and resources is free and feel 
free to suggest improvements on GitHub. The repo link is on the top right of the main page. 
Thanks already."




description_fr <- "Cette application Shiny a été créée dans le cadre d'un projet scolaire par Berthony Sully et Landy Clément en tant 
qu'évaluation pour le stage de programmation R. 

Cette application que nous proposons permet de faire une visualisation simple des données. 
Elle permet particulièrement de filter les tables par des critères que nous avons jugé pertinent et 
permet aussi d'avoir une vue sur l'évolution de l'industrie du cinéma en fonction du nombre de film publié par année ou par décennie. 

En raison des contraintes de temps, nous n'avons pas pu optimiser le code et réduire le temps d'executtion 
mais nous avons rendu l'expérience utilisateur aussi bonne que possible. L'utilisation du code et des ressources 
est libre et n'hésitez pas à proposer des améliorations sur GitHub. Le lien du repo se trouve en haut à droite de la 
page principale. Merci déjà."

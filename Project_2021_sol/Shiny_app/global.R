source("req_packages.R")
source("home_table.R")
source("podium.R")

path_ <- "./data_shiny_useable.csv"
data_ <- read.csv(file = path_, sep = ",", header = T, encoding = "uft-8")


decade_val <- uni_(data_$decade)
data_$language[data_$language == "None"] <- NA
uniGenre <- uni_(data_$genre)

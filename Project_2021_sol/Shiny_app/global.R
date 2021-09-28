library(shiny)
library(shinydashboard)
library(tidyverse)
library(stringr)
library(graphics)
library(gt)
library(glue)

path_ <- "./data_shiny_useable.csv"
data_ <- read.csv(file = path_, sep = ",", header = T, encoding = "uft-8")

decade_val <- unique(data_$decade) %>%  sort %>% as.list
data_$language[data_$language == "None"] <- NA



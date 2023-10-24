library(tidyverse)
library(ggplot2)
library(readr)


###

setwd("/home/rstudio/work")
getwd()
player_data_standard <- read.csv("source_data/player_data_standard.csv")

###



#we are going off of the assumption that Premier League is the best leage (or is it???)



#plotting data - goals per league 
Gls_Per_League <- player_data_standard %>%
  ggplot(aes(x = Gls, fill = League)) + geom_bar()

ggsave(Gls_Per_League, filename = "Figures/goalsperleague.jpeg", 
       dpi = 400, width = 5, height = 3.5)
       
Premier_Gls <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Gls)) + geom_bar()

ggsave(Premier_Gls, filename = "Figures/premierleaguegoals.jpeg", 
       dpi = 400, width = 5, height = 3.5)

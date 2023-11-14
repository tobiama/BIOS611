library(tidyverse)
library(ggplot2)
library(readr)


###

setwd("/home/rstudio/work/611")
getwd()
player_data_standard <- read.csv("source_data/player_data_standard.csv")

###



#we are going off of the assumption that Premier League is the best league (or is it???)



#plotting data - goals per league 
Gls_Per_League <- player_data_standard %>%
  ggplot(aes(x = Gls, fill = League)) + geom_bar()

ggsave(Gls_Per_League, filename = "Figures/goals_p_league.jpeg", 
       dpi = 400, width = 5, height = 3.5)
       

##
#lets look at the premier league more in depth. 
##

#ages of premier league players
Premier_Age <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Age)) + geom_bar()

ggsave(Premier_Age, filename = "Figures/PL_age.jpeg", 
       dpi = 400, width = 5, height = 3.5)

#goals scored by players in the Premier League
Premier_Gls <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Gls)) + geom_bar()

ggsave(Premier_Gls, filename = "Figures/PL_goals.jpeg", 
       dpi = 400, width = 5, height = 3.5)

#goals scored by players in the Premier League, based on team 

Premier_Gls_per_squad <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Gls, fill = Squad)) + geom_bar()

ggsave(Premier_Gls_per_squad, filename = "Figures/PL_goals_p_squad.jpeg", 
       dpi = 400, width = 5, height = 3.5)


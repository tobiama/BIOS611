library(tidyverse)
library(ggplot2)
library(readr)
library(dplyr)

library(tidyr)
library(matlab)
library(corrr)
library(ggcorrplot)
library(FactoMineR)
library(factoextra)


###

setwd("/home/rstudio/work/")
getwd()
player_data_standard <- read.csv("source_data/player_data_standard.csv")

###



#we are going off of the assumption that Premier League is the best league (or is it???)



#plotting data -  goals per league 


Gls_Per_League <- player_data_standard %>%
  ggplot(aes(x = Gls, fill = League)) + geom_bar()

ggsave(Gls_Per_League, filename = "Figures/goals_p_league.jpeg", 
       dpi = 400, width = 5, height = 3.5)
       

zoom_Gls_Per_League <- player_data_standard[player_data_standard$Gls >= 10, ] %>%
  ggplot(aes(x = Gls, fill = League)) + geom_bar()

ggsave(zoom_Gls_Per_League, filename = "Figures/zoom_goals_p_league.jpeg", 
       dpi = 400, width = 5, height = 3.5)

##
#lets look at the premier league more in depth. 
##

#ages of premier league players
Premier_Age <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Age)) + geom_bar()

ggsave(Premier_Age, filename = "Figures/PL_age.jpeg", 
       dpi = 400, width = 5, height = 3.5)


#goals scored by players in the Premier League, based on team 

Premier_Gls_per_squad <- player_data_standard %>%
  filter(League == "Premier League") %>% ggplot(aes(x = Gls, fill = Squad)) + geom_bar()

ggsave(Premier_Gls_per_squad, filename = "Figures/PL_goals_p_squad.jpeg", 
       dpi = 400, width = 5, height = 3.5)


##
# lets look at the outstanding players, 10 goals or more in a season 
##

outstanding <- player_data_standard[player_data_standard$Gls >= 10, ]

Outstanding_Gls_Per_League <- outstanding %>% 
  ggplot(aes(x = Gls, fill = League)) + geom_bar()

ggsave(Outstanding_Gls_Per_League, filename = "Figures/outstanding_goals_p_league.jpeg", 
       dpi = 400, width = 5, height = 3.5)


#lets look at the progressive stats as a whole 

for (i in 1:length(player_data_standard$Pos)){
  player_data_standard$Progressive[i] = player_data_standard$PrgC[i] + player_data_standard$PrgP[i] + player_data_standard$PrgR[i] 
}

league_means_prog <- player_data_standard %>% group_by(League) %>%
  summarise(league_means = mean(Progressive, na.rm = TRUE))

Prog_stats_p_league <- league_means_prog %>% 
  ggplot(aes(x = league_means, fill = League)) +geom_bar()

ggsave(Prog_stats_p_league, filename = "Figures/prog_stats_p_league.jpeg", 
       dpi = 400, width = 5, height = 3.5)




###crazy time 
#the clustering 

num_dta <- player_data_standard[,9:20]
norm_dta <- scale(num_dta)
corr_matrix <- cor(norm_dta)
cor_plot <- ggcorrplot(corr_matrix)

ggsave(cor_plot, filename = "Figures/cor_plot.jpeg", 
       dpi = 400, width = 5, height = 3.5)


data.pca <- princomp(corr_matrix)

transform = as.data.frame(-data.pca$loadings[,1:2])


kmeans_d = kmeans(transform, centers = 3, nstart = 10)
cluster_plot <- fviz_cluster(kmeans_d, data = transform)
ggsave(cluster_plot, filename = "Figures/cluster_plot.jpeg", 
       dpi = 400, width = 5, height = 3.5)


.PHONY: clean

clean:
	rm -rf Figures
	mkdir -p Figures
	
Figures/goalsperleague.jpeg Figures/premierleaguegoals.jpeg:\
 ./source_data/player_data_standard.csv\
 ./01_Data_Discovery.R
	Rscript ./01_Data_Discovery.R

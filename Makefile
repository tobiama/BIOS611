.PHONY: clean
.PHONY: created_directories

clean: 
	rm -rf Figures
	rm -rf .created_directories

.created_directories: 
	mkdir -p Figures
	touch .created_directories

Figures/goals_p_league.jpeg Figures/PL_goals.jpeg: \
			.created_directories\
			source_data/player_data_standard.csv\
			01_Data_Discovery.R
			Rscript 01_Data_Discovery.R 

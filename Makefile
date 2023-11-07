.PHONY: clean
.PHONY: .created_directories

clean: .created_directories
	rm -r ./Figures/*

.created_directories: 
	mkdir -p Figures

work/Figures/goalsperleague.jpeg: source_data/player_data_standard.csv 01_Data_Discovery.R
	Rscript 01_Data_Discovery.R 

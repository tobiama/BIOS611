.PHONY: clean
.PHONY: .created_directories


clean: 
	rm -rf Figures
	rm -rf created_directories
	rm -rf Report.pdf

.created_directories: 
	mkdir -p Figures
	touch .created_directories
	
Report.pdf: 
	Rscript -e "rmarkdown::render('Report.rmd', 'pdf_document')"

Figures/goals_p_league.jpeg Figures/PL_goals.jpeg Figures/PL_age.jpeg Figures/PL_goals_p_squad.jpeg: \
			.created_directories\
			source_data/player_data_standard.csv\
			01_Data_Discovery.R
			Rscript 01_Data_Discovery.R 

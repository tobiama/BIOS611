.PHONY: clean
.PHONY: .created_directories


clean: 
	rm -rf Figures
	rm -rf created_directories
	rm -rf Report.pdf

.created_directories: 
	mkdir -p Figures
	touch .created_directories
	
Figures/cor_plot.jpeg Figures/cluster_plot.jpeg Figures/PL_age.jpeg Figures/zoom_goals_p_league.jpeg Figures/prog_stats_p_league.jpeg: \
			.created_directories\
			source_data/player_data_standard.csv\
			01_Data_Discovery.R
			Rscript 01_Data_Discovery.R 
	
Report.pdf: 
	Rscript -e "rmarkdown::render('Report.Rmd', 'pdf_document')"



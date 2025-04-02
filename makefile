report: report/Final_project.html

report/Final_project.html: report/Final_project.Rmd data/demographic_info.csv data/EEG_data.csv output/delta_distribution.png output/theta_distribution.png output/grouped_summary.html
	Rscript -e "rmarkdown::render('report/Final_project.Rmd')"

delta_distribution: output/delta_distribution.png

output/delta_distribution.png: data/EEG_data.csv
	Rscript script/figure_gen.R
	

theta_distribution: output/theta_distribution.png

output/delta_distribution.png: data/EEG_data.csv
	Rscript script/figure_gen.R
	
summary: output/grouped_summary.html

output/grouped_summary.html: data/EEG_data.csv
	Rscript script/table_gen.R
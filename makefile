all: report/Final_project.html

report/Final_project.html: Final_project.Rmd data/demographic_info.csv data/EEG_data.csv output/delta_distribution.png output/theta_distribution.png output/grouped_summary.html
	Rscript -e "rmarkdown::render('Final_project.Rmd', output_file = 'Final_project.html', output_dir = 'report')"

delta_distribution: output/delta_distribution.png

output/delta_distribution.png: data/EEG_data.csv
	Rscript script/figure_gen.R

theta_distribution: output/theta_distribution.png

output/theta_distribution.png: data/EEG_data.csv
	Rscript script/figure_gen.R

summary: output/grouped_summary.html

output/grouped_summary.html: data/EEG_data.csv
	Rscript script/table_gen.R

install:
	Rscript -e 'renv::restore()'

clean:
	rm -f report/Final_project.html output/delta_distribution.png output/theta_distribution.png output/grouped_summary.html


image-build:
	docker build -t raylonc02/final-report-image

run-report-mac:
	docker run -v "$$(pwd)/report:/home/rstudio/project/report" raylonc02/final-report-image
	

run-report-win:
	docker run -v "/$$(pwd)/report:/home/rstudio/project/report" raylonc02/final-report-image


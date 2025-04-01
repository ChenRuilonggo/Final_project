report: report/Final_project.html

report/Final_project.html: report/Final_project.Rmd data/demographic_info.csv data/EEG_data.csv
	Rscript -e "rmarkdown::render('report/Final_project.Rmd')"

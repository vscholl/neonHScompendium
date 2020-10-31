
all: analysis/data/derived_data/cleaned_spectra.csv analysis/figures/study_area.pdf analysis/paper/paper.pdf

#analysis/data/raw_data/spectral-lib/all_spectra.csv: R/spectral-lib.Rmd
#	Rscript -e "rmarkdown::render('R/spectral-lib.Rmd')"

analysis/data/derived_data/cleaned_spectra.csv: R/clean_spectral_data.Rmd
	Rscript -e "rmarkdown::render('R/clean_spectral_data.Rmd')"

analysis/figures/study_area.pdf: R/create_figures.Rmd
	Rscript -e "rmarkdown::render('R/create_figures.Rmd')"

analysis/paper/paper.pdf: analysis/paper/paper.Rmd analysis/paper/references.bib analysis/paper/header.sty analysis/data/derived_data/cleaned_spectra.csv
	Rscript -e "rmarkdown::render('analysis/paper/paper.Rmd')"

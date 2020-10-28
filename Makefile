
all: analysis/paper/paper.pdf

analysis/paper/paper.pdf: analysis/paper/paper.Rmd analysis/paper/references.bib analysis/paper/header.sty analysis/data/raw_data/spectral-lib/all_spectra.csv
	Rscript -e "rmarkdown::render('analysis/paper/paper.Rmd')"

analysis/data/raw_data/spectral-lib/all_spectra.csv: R/spectral-lib.Rmd
	Rscript -e "rmarkdown::render('R/spectral-lib.Rmd')"

analysis/figures/study_area.pdf: R/create_figures.Rmd
	Rscript -e "rmarkdown::render('R/create_figures.Rmd')"

.PHONY: samples all

CC = xelatex
SAMPLES_DIR = samples
SAMPLES_RESUME_SRCS = $(shell find $(SAMPLES_DIR)/resume -name '*.tex')
SAMPLES_CV_SRCS = $(shell find $(SAMPLES_DIR)/cv -name '*.tex')

SRCS_DIR = src
SRCS_CV_INCLUDES = $(shell find $(SRCS_DIR)/cv/* -name '*.tex')

DIST_DIR = dist

all: cv

cv: $(SRCS_DIR)/cv.tex $(SRCS_CV_INCLUDES)
	$(CC) -output-directory=$(DIST_DIR) $<

samples: $(foreach x, coverletter cv resume, samples_$x.pdf)

samples_resume.pdf: $(SAMPLES_DIR)/resume.tex $(SAMPLES_RESUME_SRCS)
	$(CC) -output-directory=$(DIST_DIR) $<

samples_cv.pdf: $(SAMPLES_DIR)/cv.tex $(SAMPLES_CV_SRCS)
	$(CC) -output-directory=$(DIST_DIR) $<

samples_coverletter.pdf: $(SAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(DIST_DIR) $<

clean:
	rm -rf $(DIST_DIR)/*.pdf \
		$(DIST_DIR)/*.aux \
		$(DIST_DIR)/*.log \
		$(DIST_DIR)/*.out

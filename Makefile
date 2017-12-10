.PHONY: samples

CC = xelatex
SAMPLES_DIR = samples
RESUME_DIR = samples/resume
CV_DIR = samples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

samples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(SAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(SAMPLES_DIR) $<

cv.pdf: $(SAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(SAMPLES_DIR) $<

coverletter.pdf: $(SAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(SAMPLES_DIR) $<

clean:
	rm -rf $(SAMPLES_DIR)/*.pdf $(SAMPLES_DIR)/*.aux $(SAMPLES_DIR)/*.log $(SAMPLES_DIR)/*.out

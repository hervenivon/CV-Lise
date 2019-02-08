workflow "New workflow" {
  on = "push"
  resolves = ["LaTex build from docker"]
}

action "LaTex build from docker" {
  uses = "docker://raabf/latex-versions:latest"
  runs = "make all && cp dist/cv.pdf $HOME || exit 1"
}

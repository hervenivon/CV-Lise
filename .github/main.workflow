workflow "New workflow" {
  on = "push"
  resolves = ["LaTex build from docker"]
}

action "LaTex build from docker" {
  uses = "docker://raabf/latex-versions:latest"
  runs = "make all"
}

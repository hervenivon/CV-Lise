workflow "New workflow" {
  resolves = ["Upload CV to release"]
  on = "release"
}

action "LaTex build" {
  uses = "docker://raabf/latex-versions:latest"
  runs = "make all"
}

action "Upload CV to release" {
  uses = "JasonEtco/upload-to-release@master"
  needs = ["LaTex build"]
  args = "dist/cv.pdf application/pdf"
  secrets = ["GITHUB_TOKEN"]
}

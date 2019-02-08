workflow "New workflow" {
  on = "push"
  resolves = ["Upload CV to release"]
}

action "LaTex build" {
  uses = "docker://raabf/latex-versions:latest"
  runs = "make all"
}

action "Upload CV to S3" {
  uses = "JasonEtco/upload-to-release@master"
  needs = ["LaTex build"]
  args = "dist/cv.pdf"
  secrets = ["GITHUB_TOKEN"]
}

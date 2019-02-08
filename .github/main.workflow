workflow "New workflow" {
  on = "push"
  resolves = ["Upload CV to release"]
}

action "LaTex build from docker" {
  uses = "docker://raabf/latex-versions:latest"
  runs = "make all"
}

action "Upload CV to release" {
  uses = "JasonEtco/upload-to-release@maste"
  needs = ["LaTex build from docker"]
  args = "dist/cv.pdf"
  secrets = ["GITHUB_TOKEN"]
}

workflow "OnRelease Workflow" {
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

workflow "OnPush Workflow" {
  on = "push"
  resolves = ["Send link"]
}

action "Store file" {
  uses = "actions/aws/cli@master"
  needs = ["LaTex build"]
  args = "aws s3 cp dist/cv.pdf s3://github.com-hervenivon/CV/$GITHUB_REF/cv.pdf"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY"]
}

action "Send link" {
  uses = "actions/aws/cli@master"
  needs = ["Store file"]
  args = "aws sns publish --message \"CV Published\" --phone-number $PHONE_NUMBER"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "PHONE_NUMBER"]
}

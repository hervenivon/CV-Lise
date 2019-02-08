workflow "OnRelease Workflow" {
  on = "release"
  resolves = ["Send release link"]
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
  args = "s3 cp dist/cv.pdf s3://github.com-hervenivon/CV/$GITHUB_REF/cv.pdf --acl public-read"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY"]
}

action "Send link" {
  uses = "actions/aws/cli@master"
  needs = ["Store file"]
  args = "sns publish --message \"CV Published at https://s3.amazonaws.com/github.com-hervenivon/CV/$GITHUB_REF/cv.pdf\" --phone-number $PHONE_NUMBER"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "PHONE_NUMBER"]
}

action "Store release file" {
  uses = "actions/aws/cli@master"
  needs = ["Upload CV to release"]
  args = "\"s3 cp dist/cv.pdf s3://github.com-hervenivon/CV/$GITHUB_REF/cv.pdf --acl public-read\""
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY"]
}

action "Send release link" {
  uses = "actions/aws/cli@master"
  needs = ["Store release file"]
  args = "sns publish --message \\\"CV Published at https://s3.amazonaws.com/github.com-hervenivon/CV/$GITHUB_REF/cv.pdf\\\" --phone-number $PHONE_NUMBER"
  secrets = ["AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "PHONE_NUMBER"]
}

resource "aws_amplify_app" "this" {
  name     = var.app_name
  platform = "WEB_COMPUTE"

  # You can add build_spec here later if needed
    tags = {
    Project = "TextToSpeech"
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.this.id
  branch_name = "main"
  stage       = "PRODUCTION"
}

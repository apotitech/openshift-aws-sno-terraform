// In your bootstrap configuration

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "project-bucket-upwork-slack"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

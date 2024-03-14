terraform {
    backend "s3" {
        bucket = "project-bucket-upwork-slack"
        key    = "terraform.tfstate"
        region = "us-east-1"
    }
}

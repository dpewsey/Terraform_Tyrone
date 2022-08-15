terraform {
  backend "s3" {
    bucket = "aws-ops-test-bucket"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}


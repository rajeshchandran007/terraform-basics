terraform {
  backend "s3" {
    bucket = "rc-tf-remote-state-bucket"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}


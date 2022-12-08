terraform {
  backend "s3" {
    bucket = "rc-tf-remote-state-bucket"
    key    = "example1/terraform.tfstate"
    region = "us-east-1"
  }
}
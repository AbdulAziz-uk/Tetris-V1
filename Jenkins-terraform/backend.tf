terraform {
  backend "s3" {
    bucket = "star_bucket" # Replace with your actual S3 bucket name
    key    = "Jenkins/terraform.tfstate"
    region = "eu-west-2"
  }
}

terraform {
  backend "s3" {
    bucket = "star_bucket_eks" # Replace with your actual S3 bucket name
    key    = "eks/terraform.tfstate"
    region = "eu-west-2"
  }
}

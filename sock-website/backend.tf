# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "backend-sock-project"
    key       = "sock-website.tfstate"
    region    = "us-west-1"
    profile   = "fdelenne"
  }
}
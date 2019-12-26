## Configure Terraform
terraform {
  required_version = "0.12.7"
  required_providers {
    aws = "= 2.28.0"
  }
  backend "s3" {}
}
## provider
provider "aws" {
  region = var.region
}

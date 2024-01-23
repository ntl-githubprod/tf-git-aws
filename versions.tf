terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.33.0"
    }
  }
  # backend "s3" {
  #   bucket         = "bca-aws-master-tfstate"
  #   key            = "terraform.tfstate"
  #   region         = "ap-southeast-1"
  #   encrypt        = true
  #   profile        = "bca-aws-master" # this line is required
  #   dynamodb_table = "bca-aws-master-tfstate-locks"
  # }
}
provider "aws" {
  shared_config_files      = ["/home/vagrant/.aws/config"]
  shared_credentials_files = ["/home/vagrant/.aws/credentials"]
  profile                  = "ntl-iam-master"
#   alias                    = "gritworks-nonprod"
  region = var.aws_region
}
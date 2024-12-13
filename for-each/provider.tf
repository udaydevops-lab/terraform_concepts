terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "prajai-expense-remote-state"
    key    = "remote-state-for-each"
    region = "us-east-1"
    dynamodb_table = "expense-state-locking"
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}
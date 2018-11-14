provider "aws" {
    region = "eu-west-3"
    version = "~> 1.0"
}

resource "aws_s3_bucket" "TD1_intro_devops_bucket"{
 bucket = "abazaz-td1-intro-devops-bucket"
 acl = "public-read"
}

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
}
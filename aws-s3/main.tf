terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "sa-east-1"
  access_key = "you_access_key"
  secret_key = "you_secret_key"
}

resource "aws_s3_bucket" "bucket-01" {
  bucket = "balde-s3-websites"
  tags = {
    Name        = "bucket para websites"
    Environment = "infra"
  }
}

resource "aws_s3_bucket" "bucket-02" {
  bucket = "balde-s3-imagens"
  tags = {
    Name        = "bucket para imagens"
    Environment = "infra"
  }
}
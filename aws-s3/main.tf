terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  version = "~> 4.0"
  region  = "sa-east-1"

  assume_role_with_web_identity {
    role_arn                = "arn:aws:iam::734458512353:user/Jteste"
    session_name            = "SESSION_NAME"
    web_identity_token_file = "/home/jpedro/Documentos/swa/Jteste_accessKeys.csv"
  }
}

resource "aws_s3_bucket" "example-bucket" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

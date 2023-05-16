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


resource "aws_vpc" "my_vpc" {
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "tf-net-joao-pedro"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.31.10.0/24"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "tf-subnet-joao-pedro"
  }
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0b7af114fb404cd23" # ubuntu
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id

  tags = {
    Name = "tf-instance-joao-predo"
  }
}

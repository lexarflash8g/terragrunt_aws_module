terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-3"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "aws" {
  region     = "us-west-1"
  alias      = "us-west-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "development_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "development VPC"
  }
}

resource "aws_subnet" "development_subnet" {
  vpc_id            = aws_vpc.development_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "eu-west-3a"

  tags = {
    Name = "development subnet"
  }
}
data "aws_vpc" "imported_vpc" {
  provider = aws.us-west-1
  filter {
    name   = "cidr"
    values = ["172.31.0.0/16"]
  }
  
}



resource "aws_vpc" "managed_imported_vpc" {
  provider = aws.us-west-1
  cidr_block = "172.31.0.0/16"

  tags = {
    Name = "Imported VPC in us-west-1 region"
  }
}
resource "aws_subnet" "imported_vpc_subnet" {
  provider = aws.us-west-1
  vpc_id     = data.aws_vpc.imported_vpc.id
  cidr_block = "172.31.3.0/24"
  availability_zone = "us-west-1b"
  tags = {
    Name = "imported VPC subnet in us-west-1b region"
  }
}

output "dev-vpc-id" {
    value = aws_vpc.development_vpc.id
}

output "dev-subnet-id" {
    value = aws_vpc.development_subnet.id
}
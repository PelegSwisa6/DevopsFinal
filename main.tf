terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "eu-west-1"
}



resource "aws_vpc" "peleg-dev-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true #gives you an internal domain name
  enable_dns_hostnames = true #gives you an internal host name
  enable_classiclink   = false
  instance_tenancy     = default

  tags {
    Name = "peleg-dev-vpc"
  }
}

resource "aws_subnet" "peleg-k8s-subnet" {
  vpc_id     = aws_vpc.prod-vpc.id
  cidr_block = "10.0.0.0/27"
  tags {
    Name = "peleg-k8s-subnet"
  }
}




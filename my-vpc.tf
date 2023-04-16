provider "aws" {
    region = "eu-west-3"
  
}

#création de vpc

resource "aws_vpc" "vpc1" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc1"
    }
  
}

#subnet public

resource "aws_subnet" "public_sub1" {
    vpc_id = "aws_vpc.vpc1.id"
    cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    "Name" = "public_sub1"
  }
  
}

resource "aws_subnet" "public_sub2" {
    vpc_id = "aws_vpc.vpc1.id"
    cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    "Name" = "public_sub2"
  }
}

# Subnet privé

resource "aws_subnet" "private_sub1" {
    vpc_id = "aws_vpc.vpc1.id"
    cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-1a"
  tags = {
    "Name" = "private_sub1"
  }
  
}


resource "aws_subnet" "private_sub2" {
    vpc_id = "aws_vpc.vpc1.id"
    cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-1b"
  tags = {
    "Name" = "private_sub2"
  }
  
}






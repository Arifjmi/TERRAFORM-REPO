terraform {
	required_providers {
	  aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
	  }
	}
  }
  
  # Configure the AWS Provider
  provider "aws" {
	region = "us-east-1"
  }

  // Creating vpc

  resource "aws_vpc" "my-vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		Name = "my-vpc"
	}
  }

  // Creating private subnet

  resource "aws_subnet" "private-subnet" {
	vpc_id     = aws_vpc.my-vpc.id
	cidr_block = "10.0.1.0/24"
  
	tags = {
	  Name = "private-subnet"
	}
  }

  //Creating public subnet

  resource "aws_subnet" "public-subnet" {
	vpc_id     = aws_vpc.my-vpc.id
	cidr_block = "10.0.2.0/24"
  
	tags = {
	  Name = "public-subnet"
	}
  }

  // Creating igw

  resource "aws_internet_gateway" "my-igw" {
	vpc_id = aws_vpc.my-vpc.id
  
	tags = {
	  Name = "my-igw"
	}
  }

  // Creating route table

  resource "aws_route_table" "my-rtb" {
	vpc_id = aws_vpc.my-vpc.id
  
	route {
	  cidr_block = "0.0.0.0/0"
	  gateway_id = aws_internet_gateway.my-igw.id
	}
}

// Route table association

resource "aws_route_table_association" "public-subnet" {
	subnet_id      = aws_subnet.public-subnet.id
	route_table_id = aws_route_table.my-rtb.id
  }

  // creating ec2-instance

  resource "aws_instance" "web" {
	ami           = "ami-0ebfd941bbafe70c6"
	instance_type = "t2.micro"
	subnet_id = aws_subnet.private-subnet.id
  
	tags = {
	  Name = "my-server"
	}
  }

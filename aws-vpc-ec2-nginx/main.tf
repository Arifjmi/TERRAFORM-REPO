terraform {
	required_providers {
	  aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
	  }
	}
  }

// Creating VPC
  resource "aws_vpc" "my-vpc" {
	cidr_block = "10.0.0.0/16"
	tags = {
		Name = "my-vpc"
	}
  }

// Creating subnet

resource "aws_subnet" "my-subnet" {
	vpc_id     = aws_vpc.my-vpc.id
	cidr_block = "10.0.1.0/24"
  
	tags = {
	  Name = "my-subnet"
	}
  }
//Creating internet gatway

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

// Subnet association

resource "aws_route_table_association" "public-subnet" {
	subnet_id      = aws_subnet.my-subnet.id
	route_table_id = aws_route_table.my-rtb.id
  }

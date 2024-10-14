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

locals {
	project = "project-01"
}

// Creating vpc

resource "aws_vpc" "my-vpc" {
	cidr_block = "10.0.0.0/16"

	tags = {
		Name = "${local.project}-vpc"
	}
}

// Creating subnet

resource "aws_subnet" "my-subnet"{
	vpc_id = aws_vpc.my-vpc.id
	cidr_block = "10.0.${count.index}.0/24"
	count = 2

	tags = {
		Name = "${local.project}-subnet-${count.index}"
	}
}

// output 

output "aws_subnet_id" {
	value = aws_subnet.my-subnet[0].id  // For other subnet use [1]
}

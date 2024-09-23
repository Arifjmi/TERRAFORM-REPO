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
// creating ec2-instance

  resource "aws_instance" "web" {
	ami           = data.aws_ami.name.id
	instance_type = "t2.micro"
	subnet_id = data.aws_vpc.name.id
	security_groups = [data.aws_security_group.name.id]
  
	tags = {
	  Name = "HelloWorld"
	}
}

// data source

data "aws_ami" "name" {
	most_recent      = true
	owners           = ["amazon"]
}

//output

output "aws_ami"{
	value = data.aws_ami.name.id
}

// data source aws security group

data "aws_security_group" "name"{
	tags = {
		Name = "my-sg"
		ENV = "PROD"
	}
}

output "aws_sg" {
	value = data.aws_security_group.name.id
}

// VPC data source
data "aws_vpc" "name"{
	tags = {
		Name = "default-vpc"
	}
}

output "aws_vpc_id" {
	value = data.aws_vpc.name.id
}

// aws region

data "aws_region" "name"{}

output "region" {
	value = data.aws_region.name
}

//AZ

data "aws_availability_zones" "available" {
	state = "available"
  }

  output "aws_zones" {
	value = data.aws_availability_zones.available
  }

  // subnet data source

  data "aws_subnet" "name" {
	filter {
	  name   = "vpc-id"
	  values = [data.aws_vpc.name.id]
	}
	tags = {
		Name = "my-subnet"
	}
  }

  output "subnet-id"{
	value = data.aws_subnet.name.id
  }

// To get the account details

data "aws_caller_identity" "name" {
}

output "account-details" {
	value = data.aws_caller_identity.name
}

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

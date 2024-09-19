
terraform {
	required_providers {
	  aws = {
		source  = "hashicorp/aws"
		version = "~> 5.0"
	  }
	  random = {
		source = "hashicorp/random"
		version = "3.6.3"
	  }

	}
  }
  
  # Configure the AWS Provider
  provider "aws" {
	region = "us-east-1"
  }

  resource "random_id" "id" {
	byte_length = 8
  }

  resource "aws_s3_bucket" "my-bucket" {
	bucket = "my-bucket-${random_id.id.hex}"
  
	tags = {
	  Name        = "My bucket"
	  Environment = "Dev"
	}
  }

  output "bucket_id" {
	value = random_id.id.hex
  }


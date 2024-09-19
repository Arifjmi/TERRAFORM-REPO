
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

  //  Creating s3 bucket

  resource "aws_s3_bucket" "my-bucket" {
	bucket = "myhayats3bucket"
  
	tags = {
	  Name        = "My bucket"
	  Environment = "Dev"
	}
  }

  //  Upload file

  resource "aws_s3_object" "s3-data" {
	bucket = aws_s3_bucket.my-bucket.bucket
	key    = "mys3bucket"  // remote file
	source = "./myfile.txt"  // local file
  
	
  }


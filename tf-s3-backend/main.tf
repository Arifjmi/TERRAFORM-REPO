terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "my-bucket-28e0837e0f338657" // Existing s3 bucket
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0ebfd941bbafe70c6"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}

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

locals  {
	owner = "ABCD"
	name = "myserver"

}

resource "aws_instance" "Server1" {
  instance_type = var.instance_type
  ami           = "ami-0fff1b9a61dec8a5f"

  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_config.v_size
    volume_type           = var.ec2_config.v_type
  }

  tags = merge(var.additional_tags, {

	Name = local.name

  })

  }


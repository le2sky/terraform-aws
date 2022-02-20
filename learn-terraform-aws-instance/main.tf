//terraform setting
terraform {
  cloud {
    organization = "kukuluppingppong"
    workspaces {
      name = "terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  /*
  Because the cloud block is not supported by older versions of Terraform,
  you must use 1.1.0
  */
  required_version = ">= 1.1.0"
}

/*
configures the specified provider
A provider is a plugin that Terraform uses to create and manage your resources.
*/
provider "aws" {
  profile = "default"
  region  = "ap-northeast-2"
}

/*
define components of your infrastructure
first string is resource type (provider_resource type)
second string 2 is resource name (unique ID)
*/
resource "aws_instance" "app_server" {
  ami           = "ami-014009fa4a1467d53"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
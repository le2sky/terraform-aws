
//terraform setting
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_vesion = ">= 0.14.9"
}

//configures the specified provider
//A provider is a plugin that Terraform uses to create and manage your resources.
provider "aws" {
    profile = "default"
    region = "ap-northeast-2"
}

resource "aws_instance" "app_server" {
    ami = "ami-014009fa4a1467d53"
    instance_type = "t2.micro"

    tags = {
      Name = "Terraform tutorial App"
    }
}
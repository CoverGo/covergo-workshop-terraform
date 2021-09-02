// ---------------------------------------
// This example will simply start an ec2 instance and
// provide you with the ip of the instance
// ---------------------------------------

provider "aws" {
  region = "ap-southeast-1"
}

variable "vpc_name" {
  description = "Name given to VPC"
  type        = string
  default     = "my-vpc"
}

variable "region" {
  description = "Region where VPC should be deployed"
  type        = string
  default     = "ap-southeast-1"
}

# Generate the different AZ given the region name
# to the output will be a list in the form of:
# [ "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c" ]
locals {
  azs = formatlist("%s%s", var.region, ["a", "b", "c"])
}

# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = "10.0.0.0/16"

  azs             = local.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

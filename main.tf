provider "aws" {
  region = "eu-central-1"
  profile = "Arndt"
}

terraform {
    backend "s3" {
        bucket = "arndt-git-codebuild-terraform"
        key = "terraform.tfstate"
        region = "eu-central-1"
    }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"
  name = "Arndt-VPC"
  cidr = "10.0.0.0/16"
  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]
  public_subnet_tags = {
    Name = "Arndt-Public-Subnet"
  }
  private_subnet_tags = {
    Name = "Arndt-Private-Subnet"
  }
  tags = {
    Owner = "Arndt"
  }
}


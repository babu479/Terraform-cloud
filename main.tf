terraform {
  required_version = ">=1.2.0"
  
    required_providers {
      aws ={
        source = "hashicorp/aws"
        version = "~>4.16"
        configuration_aliases = [ aws.east,aws.west ]
      }
    }
    backend "s3" {
        bucket= "hukum-s3"
        key = "terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "terraform_state"
      
    }
}
  provider "aws" {
    region = "us-east-1"
    role_arn="arn:aws:iam::763310177211:role/Admin"
    
  }
  provider "aws" {
    alias = "west"
    region = "us-west-1"

    
  }
    


data "aws_ami_ids" "amiid" {
  provider = aws.west
  owners = ["137112412989"]
  filter{
    name="name"
    values=["amazon/al2023-ami-2023.1.20230825.0-kernel-6.1-x86_64"]


  }
  
}
/*module "Part0-Setup" {
  source = "./modules/Part0-Setup"
  bucket_properties=var.S3-Setup
}*/
module "vpc" {
    source = "./modules/Part1-Network"
    vpc_name = var.vpc_name
    vpc_cidr = var.vpc-cidr
    private_subnet = var.private_subnet
    public_subnet=var.public_subnet
    igw_name=var.igw_name
}
/*module "Part3-Ec2" {
  source = "./modules/Part3-Ec2"
}*/
/*module "Part2-sns-sqs" {
  source = "./modules/Part2-sns-sqs"
}*/

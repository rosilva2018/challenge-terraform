/*====
Cloud provide's aws
======*/

provider "aws" {
  region     = "sa-east-1"
}

/*====
Module's Network
======*/

module "network" {
  source  = "./network"
  #version = "0.1"
}

/*=== Module AWS EC2
======*/
module "servers" {
  source  = "./servers/ec2"
  servers = 1
  #version = "0.1"
}

/*=== Module AWS SG
source = "./sg"
#version = "0.1"

/*====
Remote State network's s3
======*/

terraform {
  backend "s3" {
    bucket = "tf-challenge-lab"
    key    = "lab/terraform.tfstate"
    region = "sa-east-1"
  }
}

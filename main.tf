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

/*====
Remote State network's s3
======*/

terraform {
  backend "s3" {
    bucket = "tf-challenge-lab-network"
    key    = "network/terraform.tfstate"
    region = "sa-east-1"
  }
}

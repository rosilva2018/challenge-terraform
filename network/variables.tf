/*====
Variables
======*/

variable "AWS_ACCESS_KEY" {
  default = ""
}

variable "AWS_SECRET_KEY" {
  default = ""
}

variable "AWS_REGION" {
  default = "sa-east-1"
}

/*====
Variable's cidr_block vpc main public
======*/

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_a_cidr" {
  default = "10.0.1.0/24"
}

variable "public_b_cidr" {
  default = "10.0.2.0/24"
}

variable "public_c_cidr" {
  default = "10.0.3.0/24"
}

/*====
Variable's cidr_block vpc main private
======*/

variable "private_a_cidr" {
  default = "10.0.4.0/24"
}

variable "private_b_cidr" {
  default = "10.0.5.0/24"
}

variable "private_c_cidr" {
  default = "10.0.6.0/24"
}


// VPC
variable "vpc-temporary" {
  default = ""
}

// Security group
variable "ec2-sg" {
  default = ""
}

// Image ami
variable "image" {
  default = "ami-09e67e426f25ce0d7"
}

// Instances EC2
variable "servers" {
}

// Instance type
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

// SSH Key
variable "key" {
  type    = string
  default = "key-challenge"
}

// Disk size
variable "volume-size" {
  type    = string
  default = "200"
}
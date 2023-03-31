provider "aws" {
    region = var.region
    access_key = var.access
    secret_key = var.secret
}

resource "aws_instance" "ec2_example_nishant" {
    ami= "ami-02eb7a4783e7e9317"
    instance_type = "t2.micro"
    count = var.instance_count
    associate_public_ip_address = var.enable_public_id

    tags = var.project_tags
}


variable "project_tags" {
    type = map(string)
    default = {
      "Name" = "ec2-instance"
      "project" = "project-beta"
      "enviroment" = "dev"
    }
  
}

resource "aws_iam_user" "example" {
    count = length(var.user_names)
    name =  var.user_names[count.index]
  
}

variable "user_names" {
    type = list(string)
    default = ["tf-28march-1","tf-28march-2","tf-28march-3"]
  
}
variable "enable_public_id" {
    type = bool
    default = true
  
}

variable "region" {
    type = string
    default = "ap-south-1"
}

variable "instance_count" {
    type = number
    default = 2
  
}

variable "access" {
    type = string
    default = "your access key goes here"
}


variable "secret" {
    type = string
    default = "secret key goes here"
  
}

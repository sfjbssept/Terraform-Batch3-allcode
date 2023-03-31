provider "aws" {
    region = var.region
}

resource "aws_instance" "ec2_example_nishant" {
    ami= "ami-02eb7a4783e7e9317"
    instance_type = var.instance_type
    tags = {
        Name = "Terraform Ec2"
    }
}

resource "aws_vpc" "demo-main" {
  cidr_block = "10.0.0.0/18"
  tags = {
    "Name" = "DemoVPC-Nishant"
  }
} 
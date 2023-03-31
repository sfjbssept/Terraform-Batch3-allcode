provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "ec2_example_nishant" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = var.instance_type


  tags = {
    Name = "Terraform Ec2 Nishant"
  }
}
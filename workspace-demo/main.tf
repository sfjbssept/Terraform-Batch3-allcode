provider "aws" {
    region = var.region
}

resource "aws_instance" "ec2_test_branch" {
    ami= "ami-02eb7a4783e7e9317"
    instance_type = var.instance_type
    tags = {
        Name = "Terraform Ec2"
    }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_vpc" "demo-main" {
  cidr_block = "10.0.0.0/18"
  tags = {
    "Name" = "DemoVPC-Nishant"
  }
} 
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.demo-main.id
    cidr_block = "10.0.0.0/24"

    tags = {
      "Name" = "Public Subnet"
    }
}
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.demo-main.id
    cidr_block = "10.0.1.0/24"

    tags = {
      "Name" = "Private Subnet"
    }
}
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.demo-main.id
    tags = {
      "Name" = "Demo IGN"
    }
  
}
resource "aws_eip" "nat_eip" {
    vpc = true
    depends_on = [
      aws_internet_gateway.IGW
    ]
    tags = {
      "Name" = "NAT GATEWAY EIP"
    } 
}

resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public.id

    tags = {
      "Name" = "Main NAt Gateway"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.demo-main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
    tags ={
        Name="Public Route Table"
    }
}

resource "aws_route_table_association" "public" {
subnet_id = aws_subnet.public.id
route_table_id = aws_route_table.public.id
}






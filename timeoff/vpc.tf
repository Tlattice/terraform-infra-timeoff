# Virtual Private Cloud
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "vpc1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc1"
  }
}
# Table association
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association
resource "aws_main_route_table_association" "route_table_association" {
  vpc_id         = aws_vpc.vpc1.id
  route_table_id = aws_route_table.rt1.id
}


# Virtual Private Cloud
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
resource "aws_internet_gateway" "ig1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "ig1"
  }
}

# Route Table
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id

  route {
    #cidr_block = aws_subnet.sn1.cidr_block
    cidr_block    = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig1.id
  }

  tags = {
    Name = "rt1"
  }
}

# Subnets
# docs from:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
resource "aws_subnet" "sn1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sn1"
  }
}

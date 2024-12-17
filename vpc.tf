resource "aws_vpc" "vpc_1" {
  cidr_block = var.cidr[0].cidr
  tags = {
    Name = "${var.environment}-vpc-1"
  }
}

resource "aws_vpc" "vpc_2" {
  cidr_block = var.cidr[2].cidr
  tags = {
    Name = "${var.environment}-vpc-2"
  }
}

resource "aws_vpc" "vpc_3" {
  cidr_block = var.cidr[4].cidr
  tags = {
    Name = "${var.environment}-vpc-3"
  }
}

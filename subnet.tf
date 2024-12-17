resource "aws_subnet" "vpc_1_private_subnet" {
  vpc_id            = aws_vpc.vpc_1.id
  cidr_block        = var.cidr[1].cidr
  availability_zone = var.AZs[0]
  tags = {
    Name = "${var.environment}-vpc-1-priv-subnet"
  }
}

resource "aws_route_table" "vpc_1_route_table" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block         = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  }
  tags = {
    Name = "${var.environment}-vpc-rtb-1"
  }
}

resource "aws_route_table_association" "associate_route_table_1_to_subnet" {
  subnet_id      = aws_subnet.vpc_1_private_subnet.id
  route_table_id = aws_route_table.vpc_1_route_table.id
}


resource "aws_subnet" "vpc_2_private_subnet" {
  vpc_id            = aws_vpc.vpc_2.id
  cidr_block        = var.cidr[3].cidr
  availability_zone = var.AZs[1]
  tags = {
    Name = "${var.environment}-vpc-2-priv-subnet"
  }
}

resource "aws_route_table" "vpc_2_route_table" {
  vpc_id = aws_vpc.vpc_2.id

  route {
    cidr_block         = "0.0.0.0/0"
    transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  }
  tags = {
    Name = "${var.environment}-vpc-rtb-2"
  }
}

resource "aws_route_table_association" "associate_route_table_2_to_subnet" {
  subnet_id      = aws_subnet.vpc_2_private_subnet.id
  route_table_id = aws_route_table.vpc_2_route_table.id
}


resource "aws_subnet" "vpc_3_public_subnet" {
  vpc_id            = aws_vpc.vpc_3.id
  cidr_block        = var.cidr[5].cidr
  availability_zone = var.AZs[2]
  tags = {
    Name = "${var.environment}-vpc-3-pub-subnet"
  }
}

resource "aws_route_table" "vpc_3_public_route_table" {
  vpc_id = aws_vpc.vpc_3.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_3_internet_gateway.id
  }
  route {
    cidr_block         = var.cidr[0].cidr
    transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  }
  route {
    cidr_block         = var.cidr[2].cidr
    transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id

  }
  tags = {
    Name = "${var.environment}-vpc-rtb-3"
  }
}

resource "aws_route_table_association" "associate_route_table_3_to_subnet" {
  subnet_id      = aws_subnet.vpc_3_public_subnet.id
  route_table_id = aws_route_table.vpc_3_public_route_table.id
}

resource "aws_internet_gateway" "vpc_3_internet_gateway" {
  vpc_id = aws_vpc.vpc_3.id
  tags = {
    Name = "${var.environment}-vpc-igw-3"
  }
}

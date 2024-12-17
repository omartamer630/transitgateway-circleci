resource "aws_ec2_transit_gateway" "forgtech_transit_gw" {
  description                     = "managing the internet traffic flow-driven from/to the private subnets to the public subnets"
  default_route_table_association = "disable"
}

resource "aws_ec2_transit_gateway_route_table" "forgtech_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  tags = {
    Name = "${var.environment}-tgw-route-table"
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attach_rtb_1_to_tgw" {
  subnet_ids         = [aws_subnet.vpc_1_private_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  vpc_id             = aws_vpc.vpc_1.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_vpc_1" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_1_to_tgw.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "route_to_vpc_1" {
  destination_cidr_block         = var.cidr[0].cidr
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_1_to_tgw.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attach_rtb_2_to_tgw" {
  subnet_ids         = [aws_subnet.vpc_2_private_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  vpc_id             = aws_vpc.vpc_2.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_vpc_2" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_2_to_tgw.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "route_to_vpc_2" {
  destination_cidr_block         = var.cidr[2].cidr
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_2_to_tgw.id
}

resource "aws_ec2_transit_gateway_vpc_attachment" "attach_rtb_3_to_tgw" {
  subnet_ids         = [aws_subnet.vpc_3_public_subnet.id]
  transit_gateway_id = aws_ec2_transit_gateway.forgtech_transit_gw.id
  vpc_id             = aws_vpc.vpc_3.id
}

resource "aws_ec2_transit_gateway_route_table_association" "assoc_vpc_3" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_3_to_tgw.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "route_to_vpc_3" {
  destination_cidr_block         = var.cidr[4].cidr
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.forgtech_tgw_rt.id
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.attach_rtb_3_to_tgw.id
}

resource "aws_security_group" "forgtech_ec2_sg_vpc_2" {
  name        = "ec2-sg"
  description = "ec2 rules"
  vpc_id      = aws_vpc.vpc_2.id
  tags = {
    Name = "${var.environment}-EC2-SG-2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "forgtech-ec2-ingress_vpc_2" {
  security_group_id = aws_security_group.forgtech_ec2_sg_vpc_2.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "forgtech-ec2-egress_vpc_2" {
  security_group_id = aws_security_group.forgtech_ec2_sg_vpc_2.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_security_group" "forgtech_ec2_sg_vpc_3" {
  name        = "ec2-sg"
  description = "ec2 rules"
  vpc_id      = aws_vpc.vpc_3.id
  tags = {
    Name = "${var.environment}-EC2-SG-2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "forgtech-ec2-ingress_vpc_3" {
  security_group_id = aws_security_group.forgtech_ec2_sg_vpc_3.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_egress_rule" "forgtech-ec2-egress_vpc_3" {
  security_group_id = aws_security_group.forgtech_ec2_sg_vpc_3.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

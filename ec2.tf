# Create EC2 for VPC-2
resource "aws_instance" "ec2_vpc_2" {
  ami                    = "ami-0a3c3a20c09d6f377"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.vpc_2_private_subnet.id
  vpc_security_group_ids = [aws_security_group.forgtech_ec2_sg_vpc_2.id]
  key_name               = "forgtech-keypair"

  tags = {
    Name = "${var.environment}-EC2-2"
  }
}


# Create EC2 for VPC-3
resource "aws_instance" "ec2_vpc_3" {
  ami                         = "ami-0a3c3a20c09d6f377"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.vpc_3_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.forgtech_ec2_sg_vpc_3.id]
  key_name                    = "forgtech-keypair"

  tags = {
    Name = "${var.environment}-EC2-3"
  }
}

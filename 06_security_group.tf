resource "aws_security_group" "Bastion" {
  name        = "sg_swjang_Bastion"
  description = "sg_swjang_Bastion"
  vpc_id      = aws_vpc.VPC_swjang.id

  ingress {
    description = "ALL to Bastion SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "External Connection"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_swjang_bastion"
  }
}
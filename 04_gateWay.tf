#인터넷 게이트웨이
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.VPC_swjang.id # VPC

  tags = {
    Name = "IG_swjang"
  }
}

#NAT 게이트웨이
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.NAT.id                  # 탄력적 IP(EIP)
  subnet_id     = aws_subnet.Public_swjang_sub_01.id # 서브넷

  tags = {
    Name = "nat_swjang"
  }
}
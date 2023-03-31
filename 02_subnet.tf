# subnet 이름 변경 필수
# 리전 cidr_block 확인

#ALB 2개
resource "aws_subnet" "Public_swjang_sub_01" {
  vpc_id            = aws_vpc.VPC_swjang.id # VPC
  cidr_block        = "10.60.10.0/24"     # IPv4 CIDR 블록
  availability_zone = "${var.region}a"  # 가용지역

  tags = {
    Name = "Public_swjang_sub_01"
  }
}

#WEB 2개
resource "aws_subnet" "Private_swjang_sub_01" {
  vpc_id            = aws_vpc.VPC_swjang.id
  cidr_block        = "10.60.100.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private_swjang_sub_01"
  }
}
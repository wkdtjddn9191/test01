# 퍼블릭 라우팅 테이블
resource "aws_route_table" "RT_Public" {
  vpc_id = aws_vpc.VPC_swjang.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }

  tags = {
    Name = "RT_Public_swjang"
  }
}

# 프라이빗 라우팅 테이블
resource "aws_route_table" "RT_Private" {
  vpc_id = aws_vpc.VPC_swjang.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT.id
  }

  tags = {
    Name = "RT_Private_swjang"
  }
}

# 퍼블릭 라우팅 테이블 이름 확인
# 서브넷 목록 리스트를 라이팅 테이블로 엮음
resource "aws_route_table_association" "Public_Subnet" {
  subnet_id      = aws_subnet.Public_swjang_sub_01.id
  route_table_id = aws_route_table.RT_Public.id
}

# 프라이빗 라우팅 테이블 이름 확인
resource "aws_route_table_association" "Private_Subnet" {
  subnet_id      = aws_subnet.Private_swjang_sub_01.id
  route_table_id = aws_route_table.RT_Private.id
}
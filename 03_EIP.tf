resource "aws_eip" "NAT" {
  vpc                  = true
  network_border_group = var.region # 네트워크 경계 그룹
  public_ipv4_pool     = "amazon"   # 퍼블릭 IPv4 주소 폴
  tags = {
    Name = "eip_nat_swjang"
  }
}

resource "aws_eip" "Bastion_01" {
  instance             = aws_instance.Bastion_01.id
  vpc                  = true
  network_border_group = var.region
  public_ipv4_pool     = "amazon"

  tags = {
    Name = "eip_bastion_swjang"
  }
}

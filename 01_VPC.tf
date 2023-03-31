# VPC 이름 변경
# cidr 확인

resource "aws_vpc" "VPC_swjang" {
  cidr_block                       = "10.60.0.0/16" # IPv4 CIDR 블록
  assign_generated_ipv6_cidr_block = "false"       # IPv6 CIDR 블록 여부: true or false
  instance_tenancy                 = "default"     # 테넌시
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"

  tags = {
    Name = "swjang_vpc" # 태그
  }
}
#해당 인스턴스는 EIP와 연결되어있음
#명세서와 맞는지 확인 필수(ami, region, type, subnet, ip, 용량)
#EC2_Jang_Prod_Bastion_01_KRAWSAP0001
resource "aws_instance" "Bastion_01" {
  ami                                  = var.ubu20                          # 생성 OS
  instance_type                        = "t2.micro"                          # 인스턴스 타입
  availability_zone                    = "${var.region}a"                    # 생성 지역
  subnet_id                            = aws_subnet.Public_swjang_sub_01.id # bastion subnet
  instance_initiated_shutdown_behavior = "stop"                              # 종료방식
  disable_api_termination              = "false"                             # 우발적 종료 보호

  #EIP와 연결된 인스턴스는 public_ip를 적지 않음.
  private_ip             = "10.60.10.10"
  vpc_security_group_ids = [aws_security_group.Bastion.id] # 보안 그룹
  key_name               = var.key_name

  #저장소
  root_block_device {
    volume_type           = "gp2"   # default: gp2
    volume_size           = "30"    # 용량
    delete_on_termination = "true"  # 인스턴스 삭제 시, 자동 삭제
    encrypted             = "false" # 암호화

    tags = {
      Name = "Volume_swjang_bastion"
    }
  }

  tags = {
    Name = "ec2_swjang_bastion"
  }
}

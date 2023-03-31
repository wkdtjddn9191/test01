#사전에 AWS 콘솔에서 key_pair 생성해서 이름을 넣어야 됨
variable "key_name" {
  default     = "keypair_swjang"
  description = "키페어 이름"
}

# 00_AWS.tf 백엔드 region 수정해야됨
# s3_backend 폴더의 backend.tf region도 수정해야됨
variable "region" {
  default     = "ap-northeast-2"
  description = "서버 생성 지역 입력"
}

#리전마다 ami 값이 다르니 확인 필수.
variable "amzn2" {
  default     = "ami-04f77aa5970939148"
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type"
}
variable "ubu20" {
  default     = "ami-0e735aba742568824"
  description = "Ubuntu 20.04 LTs"
}
variable "win2016" {
  default     = "ami-05f1bac3bdba6d300"
  description = "Microsoft Windows Server 2016 Base"
}
variable "ubuntu18" {
  default     = "ami-00ddb0e5626798373"
  description = "Ubuntu Server 18.04 LTS (HVM), SSD Volume Type"
}

# 스토리지 이름은 변경될 수 있음.
variable "volume_amzn2" {
  default     = "/dev/xvda"
  description = "아마존 리눅스2 인스턴스 스토리지 디바이스 이름"
}
variable "volume_win2016" {
  default     = "/dev/sda1"
  description = "윈도우 서버 2016 인스턴스 스토리지 디바이스 이름"
}

variable "volume_ubuntu" {
  default   = "/dev/sda1"
  description = "Ubuntu 서버 스토리지 디바이스 이름"
}

variable "os_amzn2" {
  default     = "A"
  description = "os 아마존 리눅스 1글자"
}
variable "os_win" {
  default     = "W"
  description = "os 윈도우 1글자"
}
variable "os_ubun" {
  default     = "U"
  description = "ubuntu 1글자"
}
# 백엔드 리전 꼭 확인

# 프로필 변경
provider "aws" {
  profile = "default" # 사용자폴더/.aws/credentials 수정필수
  region  = var.region
}
resource "aws_default_vpc" "ci_cd_ecs_vpc" {
  tags = {
    Name = "ci-cd-ecs-vpc"
  }
}

resource "aws_default_subnet" "ci_cd_ecs_vpc_az" {
  availability_zone = "us-east-1"

  tags = {
    Name = "Default subnet for us-east-1"
  }
}

resource "aws_ecr_repository" "ci_cd_ecr_repository" {
  name = "gustavo-piovesan-shop-monorepo"
  image_tag_mutability = "MUTABLE"
}
resource "aws_iam_role" "ci_cd_ecs_iam_role" {
  name               = "ci_cd_ecs_iam_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ci-cd-ecs-tasks.amazonaws.com"]
    }
  }
}
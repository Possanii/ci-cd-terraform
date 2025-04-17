resource "aws_ecs_task_definition" "ci_cd_ecs_task" {
  family                    = "ci-cd-ecs-task"
  container_definitions     = <<DEFINITION
[
  {
    "name": "ci-cd-ecs-task",
    "image": "${module.ecr.ci_cd_ecr_repository_url}:latest",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 512,
    "cpu": 256,
    "networkMode": "awsvpc"
  }
]
  DEFINITION
  requires_compatibilities  = ["EC2"]
  network_mode              = "awsvpc"
  memory                    = 512
  execution_role_arn        = aws_iam_role.ci_cd_ecs_iam_role.arn
  cpu                       = 256
}
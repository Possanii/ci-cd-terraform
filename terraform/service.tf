resource "aws_ecs_service" "ci_cd_ecs_service" {
  name              = "gft-test-first-services"
  cluster           = aws_ecs_cluster.ci_cd_ecs_cluster.id
  task_definition   = aws_ecs_task_definition.ci_cd_ecs_task.arn
  launch_type       = "EC2"
  scheduling_strategy = "REPLICA"
  desired_count     = 1

  network_configuration {
    subnets          = [aws_default_subnet.ci_cd_ecs_vpc_az.id]
    assign_public_ip = true
  }
}
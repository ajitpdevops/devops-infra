resource "aws_cloudwatch_log_group" "cwa_log_group" {
  name = "/ecs/cwa-app"
  retention_in_days = 30

  tags = {
    "Name" = "cwa_log-group"
  }
}

resource "aws_cloudwatch_log_stream" "cwa_log_stream" {
  name = "cwa-log-stream"
  log_group_name = aws_cloudwatch_log_group.cwa_log_group.name
}



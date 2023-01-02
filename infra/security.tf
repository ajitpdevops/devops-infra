# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "lb" {
  name          = "cwa-load-balancer-security-group"
  description   = "controls access to the ALB"
  vpc_id        = aws_vpc.main.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol = "tcp"
    to_port = 0
  } 

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_task" {
  name          = "cwa-ecs-tasks-security-group"
  description   = "Allow inbound access from the ALB Only"
  vpc_id        = aws_vpc.main.id

  ingress {
    from_port = var.app_port
    protocol = "tcp"
    security_groups = [ aws_security_group.lb.id ]
    to_port = var.app_port
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}
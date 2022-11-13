resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "Allow jenkins inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh_location}"]
  }
  ingress {
    description      = "jenkins web"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_security_group" "nexus-sg" {
  name        = "nexus-sg"
  description = "Allow nexus inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh_location}"]
  }
  ingress {
    description      = "From Jenkins"
    from_port        = 8081
    to_port          = 8081
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh_location}"]
    security_groups = [
      "${aws_security_group.jenkins-sg.id}",
    ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "nexus-sg"
  }
}

resource "aws_security_group" "sonar-sg" {
  name        = "sonar-sg"
  description = "Allow sonar inbound traffic"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh_location}"]
  }
  ingress {
    description      = "From Jenkins"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh_location}"]
    security_groups = [
      "${aws_security_group.jenkins-sg.id}",
    ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sonar-sg"
  }
}
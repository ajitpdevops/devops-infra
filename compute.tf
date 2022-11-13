resource "aws_instance" "jenkins-server" {
  ami = var.instance_ubuntu_ami
  instance_type = var.instance_type
  key_name = var.instance_keypair
  availability_zone = var.instance_zone 
  security_groups = [aws_security_group.jenkins-sg.name]
  user_data = "${file("./userdata/jenkins-server-setup.sh")}"

  tags = {
    Name = "jenkins-server"
  }
}

resource "aws_instance" "nexus-server" {
  ami = var.instance_amzn_ami
  instance_type = var.instance_type
  key_name = var.instance_keypair
  availability_zone = var.instance_zone 
  security_groups = [aws_security_group.nexus-sg.name]
  user_data = "${file("./userdata/nexus-server-setup.sh")}"

  tags = {
    Name = "nexus-server"
  }
}

resource "aws_instance" "sonarqube-server" {
  ami = var.instance_ubuntu_ami
  instance_type = var.instance_type
  key_name = var.instance_keypair
  availability_zone = var.instance_zone 
  security_groups = [aws_security_group.sonar-sg.name]
  user_data = "${file("./userdata/sonar-server-setup.sh")}"

  tags = {
    Name = "sonarqube-server"
  }
}
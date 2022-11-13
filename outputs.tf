## ec2_bastion_public_instance_ids
output "ec2_jenkins_server" {
  description = "Jenkins Public IP Address"
  value       = aws_instance.jenkins-server.public_ip
}

## ec2_bastion_public_ip
output "ec2_nexus_server" {
  description = "Nexus Server IP"
  value       = aws_instance.nexus-server.public_ip
}

output "ec2_sonar_server" {
  description = "Sonar Server IP"
  value       = aws_instance.sonarqube-server.public_ip
}


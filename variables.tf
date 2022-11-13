# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t2.micro"  
}

# AWS EC2 AMI ID
variable "instance_ubuntu_ami" {
  description = "EC2 AMI ID"
  type = string
  default = "ami-097a2df4ac947655f"
}

# AWS EC2 AMI ID
variable "instance_amzn_ami" {
  description = "EC2 AMI ID"
  type = string
  default = "ami-089a545a9ed9893b6"
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "devops-practise"
}

# AWS Region
variable "instance_zone" {
  description = "AWS EC2 Zone"
  type = string
  default = "us-east-2a"
}

# My IP Address
variable "ssh_location" {
  description = "SSH Location Public IP"
  type = string
  default = "103.208.69.172/32"
}
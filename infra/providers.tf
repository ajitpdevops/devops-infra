terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.0"
    }
  }

}

provider "aws" {
  profile = "cwa-admin"
  region = var.aws_region
}

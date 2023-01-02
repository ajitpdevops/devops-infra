terraform {
  backend "s3" {
    bucket  = "cwa-devops-terraform-backend"
    key     = "github-actions.tfstate"
    region  = "us-east-2"
    profile = "cwa-admin"
  }
}
terraform {
  backend "s3" {
    bucket         = "terraform-jenkinss"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

terraform {
  backend "s3" {
    bucket         = "fiap-fastfood-infrastructure-terraform-state"
    key            = "terraform.tfstate"  
    region         = "us-east-1"          
    encrypt        = true                 
  }
}
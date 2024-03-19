#module "eks" {
#    source = "./modules/eks"
#    
#    env = var.env
#}

module "cognito" {
  source = "./modules/cognito"

  env = var.env
}
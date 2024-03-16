module "eks" {
    source = "./modules/eks"
    
    env = var.env
}

module "secret_manager" {
    source = "./modules/secret-manager"
  
    env = var.env
}
resource "aws_eks_cluster" "eks_cluster_fiap_fastfood" {
  name     = "eks-fiap-fastfood-${var.env}"
  role_arn = "arn:aws:iam::992382573086:role/LabRole"
  version  = "1.29"

  vpc_config {
    subnet_ids = ["subnet-046d8e41390496627", "subnet-00af893ac1ff6caad", "subnet-0518aef11d62b205c", "subnet-0d8efc6b594c5a1bd", "subnet-05d2a70c86d4b1053"]
    security_group_ids = ["sg-06b6505936b2005e2"]
    endpoint_public_access = true
  }
}

resource "aws_eks_node_group" "eks_cluster_fiap_fastfood_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster_fiap_fastfood.name
  node_group_name = "eks-cluster-fiap-fastfood-node-group-${var.env}"
  node_role_arn   = aws_eks_cluster.eks_cluster_fiap_fastfood.role_arn
  subnet_ids      = aws_eks_cluster.eks_cluster_fiap_fastfood.vpc_config[0].subnet_ids
  instance_types  = ["t3.medium"]
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }
  depends_on = [aws_eks_cluster.eks_cluster_fiap_fastfood]
}
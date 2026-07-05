module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.0.0"

  name               = "${var.project_name}-eks"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {

    default = {

      instance_types = ["t3.small"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      ami_type = "AL2023_x86_64_STANDARD"

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Project = var.project_name
  }
}

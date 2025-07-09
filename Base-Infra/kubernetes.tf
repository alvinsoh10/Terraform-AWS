locals {
name = "test-eks"
tags = "this is a test"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"
  
  cluster_name                   = local.name
  cluster_version = "1.32"
  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = aws_vpc.main.id
  subnet_ids               = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]
  control_plane_subnet_ids = [aws_subnet.private_1a.id, aws_subnet.private_1b.id]

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_ARM_64"
    instance_types = ["t4g.small"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    ascode-cluster-wg = {
      min_size     = 1
      max_size     = 2
      desired_size = 1

      instance_types = ["t4g.small"]
      capacity_type  = "SPOT"

      tags = {
        ExtraTag = local.tags
      }
    }
  }
}
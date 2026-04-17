############################################
# EKS
############################################
output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_ca" {
  value = module.eks.cluster_ca
}

output "cluster_security_group" {
  value = module.eks.cluster_security_group
}

############################################
# OIDC
############################################
output "oidc_provider" {
  value = module.eks.oidc_provider
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}

############################################
# NETWORK
############################################
output "vpc_id" {
  value = module.eks.vpc_id
}

output "subnet_ids" {
  value = module.eks.subnet_ids
}

############################################
# NODE GROUP
############################################
output "node_group_name" {
  value = module.eks.node_group_name
}

############################################
# IAM
############################################
output "karpenter_role_arn" {
  value = module.eks.karpenter_role_arn
}
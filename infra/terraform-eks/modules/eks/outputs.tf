############################################
# EKS
############################################
output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_ca" {
  description = "Certificado do cluster (base64)"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_security_group" {
  description = "Security Group do cluster"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

############################################
# OIDC (IRSA)
############################################
output "oidc_provider" {
  description = "OIDC provider URL"
  value       = aws_iam_openid_connect_provider.eks.url
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN"
  value       = aws_iam_openid_connect_provider.eks.arn
}

############################################
# NETWORK
############################################
output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "Lista de subnets"
  value = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
}

############################################
# NODE GROUP
############################################
output "node_group_name" {
  description = "Nome do node group"
  value       = aws_eks_node_group.main.node_group_name
}

############################################
# IAM
############################################
output "karpenter_role_arn" {
  description = "IAM Role do Karpenter"
  value       = aws_iam_role.karpenter.arn
}
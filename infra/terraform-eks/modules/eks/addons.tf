############################################
# DATA SOURCE (EVITA BUG DE ENDPOINT)
############################################
data "aws_eks_cluster" "main" {
  name = aws_eks_cluster.main.name
}

############################################
# METRICS SERVER
############################################
resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  namespace  = "kube-system"

  depends_on = [aws_eks_node_group.main]

  set = [
    {
      name  = "args"
      value = "{--kubelet-insecure-tls,--kubelet-preferred-address-types=InternalIP}"
    }
  ]
}

############################################
# INGRESS NGINX
############################################
resource "helm_release" "ingress_nginx" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"

  create_namespace = true

  depends_on = [aws_eks_node_group.main]

  set = [
    {
      name  = "controller.service.type"
      value = "LoadBalancer"
    }
  ]
}

############################################
# KARPENTER
############################################
resource "helm_release" "karpenter" {
  name       = "karpenter"
  namespace  = "karpenter"
  repository = "oci://public.ecr.aws/karpenter"
  chart      = "karpenter"
  version    = "1.0.0"

  create_namespace = true

  # 🔥 EVITA timeout do Helm
  wait    = true
  timeout = 600

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.main
  ]

  set = [
    # 🔐 IRSA (ESSENCIAL)
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = aws_iam_role.karpenter.arn
    },

    # 🧠 CONFIG DO CLUSTER 
    {
      name  = "settings.clusterName"
      value = aws_eks_cluster.main.name
    },
    {
      name  = "settings.clusterEndpoint"
      value = data.aws_eks_cluster.main.endpoint
    }
  ]
}
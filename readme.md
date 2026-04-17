# 🚀 EKS CI/CD Lab com Karpenter

Projeto prático de infraestrutura e deploy utilizando **AWS EKS, Terraform, Karpenter e Kubernetes**, com foco em simular um ambiente real de **SRE/DevOps**.

---

## 🧱 Arquitetura

* AWS EKS (Kubernetes gerenciado)
* Terraform (Infra as Code)
* Karpenter (autoscaling de nodes)
* Helm (deploy de aplicação)
* GitHub Actions (CI/CD)

---

## 📂 Estrutura do Projeto

```
.
├── infra/                 # Terraform (EKS, VPC, IAM)
├── k8s/                   # Manifests Kubernetes
│   ├── karpenter/         # NodePool e EC2NodeClass
│   └── apps/              # Aplicações (stress test)
├── nginx-chart/           # Helm chart da aplicação
├── .github/workflows/     # Pipeline CI/CD
└── README.md
```

---

## ⚙️ Infraestrutura

Provisionada com Terraform:

* VPC customizada
* Subnets públicas
* EKS Cluster
* Node Group inicial
* IAM Roles (incluindo Karpenter)

### 📌 Comandos

```bash
cd infra/terraform-eks/envs/dev
terraform init
terraform apply
```

---

## ⚡ Autoscaling com Karpenter

O Karpenter é responsável por:

* Criar nodes sob demanda
* Ajustar capacidade automaticamente
* Otimizar custo e performance

### Recursos utilizados:

* EC2NodeClass
* NodePool

---

## 🚀 Deploy da Aplicação

Aplicação nginx com HPA + stress test para simular carga.

```bash
kubectl apply -f k8s/karpenter/
kubectl apply -f k8s/apps/nginx/
```

---

## 📈 Teste de Escala

```bash
kubectl scale deployment stress --replicas=10
kubectl get nodes -w
```

---

## 🔁 CI/CD

Pipeline com GitHub Actions:

* Deploy automático de manifests Kubernetes
* Atualização da aplicação via Helm

---

## 🧠 Aprendizados

* Provisionamento completo de EKS com Terraform
* Configuração de Karpenter do zero
* Troubleshooting de IAM, VPC e EC2
* Limitações de AWS Free Tier na prática
* Separação entre infra e workloads

---

## ⚠️ Observações

* Projeto adaptado para funcionar em ambiente Free Tier
* Algumas limitações de scaling devido à conta AWS

---

## 👩‍💻 Autora

**Rayne Marquez**
SRE | DevOps | Kubernetes | AWS

---

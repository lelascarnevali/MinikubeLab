
# Minikube + ArgoCD + Terraform DataOps Project

Este repositório contém um laboratório de provisionamento do ArgoCD e Airflow em um cluster Minikube usando Terraform e Helm, seguindo as melhores práticas de DataOps.

## Estrutura do Projeto

```
minikube-argocd-terraform/
├── README.md
├── .gitignore
├── infra/
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── data.tf
│   ├── env/
│   │   ├── dev.tfvars
│   │   ├── prod.tfvars
│   │   └── staging.tfvars
│   └── modules/
│       ├── helm/
│       │   ├── argocd/
│       │   │   ├── main.tf
│       │   │   ├── variables.tf
│       │   │   └── outputs.tf
│       │   ├── airflow/
│       │   │   ├── main.tf
│       │   │   ├── variables.tf
│       │   │   └── outputs.tf
│       └── k8s_namespace/
│           ├── main.tf
│           └── variables.tf
├── charts/
│   ├── argocd/
│   ├── airflow/
│   └── requirements.yaml
├── airflow/
│   ├── dags/
│   ├── plugins/
│   ├── Dockerfile
│   └── README.md
├── scripts/
│   ├── port-forward-argocd.sh
│   ├── get-admin-password.sh
│   └── setup.sh
└── ci/
    ├── github-actions.yaml
    └── azure-pipelines.yaml
```

## Como usar

1. Configure o kubeconfig para seu cluster Minikube.
2. Execute o setup:
   ```sh
   ./scripts/setup.sh
   ```
3. Use os scripts utilitários para acessar o ArgoCD e Airflow.

## Objetivo

Facilitar o aprendizado e a prática de infraestrutura como código, GitOps e automação de ambientes Kubernetes locais, com foco em DataOps.


# Minikube + ArgoCD + Terraform DataOps Project

Este repositório contém um laboratório de provisionamento do ArgoCD e Airflow em um cluster Minikube usando Terraform e Helm, seguindo as melhores práticas de DataOps.


## Pré-requisitos

- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://www.terraform.io/downloads.html)

Certifique-se de que o Docker Desktop está rodando e que o Minikube está instalado e configurado.

## Estrutura do Projeto

```text
minikube-argocd-terraform/
├── README.md                  # Documentação principal do projeto
├── .gitignore                 # Arquivos e pastas ignorados pelo Git
├── infra/                     # Infraestrutura como código (Terraform)
│   ├── main.tf                # Chama módulos e define recursos principais
│   ├── providers.tf           # Configuração dos providers (Kubernetes, Helm, etc)
│   ├── variables.tf           # Variáveis globais do projeto
│   ├── outputs.tf             # Outputs globais do projeto
│   ├── data.tf                # Data sources (ex: secrets, external)
│   ├── env/                   # Variáveis de ambiente por ambiente
│   │   ├── dev.tfvars         # Variáveis para ambiente de desenvolvimento
│   │   ├── prod.tfvars        # Variáveis para ambiente de produção
│   │   └── staging.tfvars     # Variáveis para ambiente de homologação
│   └── modules/               # Módulos Terraform reutilizáveis
│       ├── helm/              # Módulos para deploy via Helm
│       │   ├── argocd/        # Módulo para deploy do ArgoCD
│       │   └── airflow/       # Módulo para deploy do Airflow
│       └── k8s_namespace/     # Módulo para criação de namespaces
├── charts/                    # Helm charts customizados ou dependências
│   ├── argocd/                # Chart do ArgoCD (se customizado)
│   ├── airflow/               # Chart do Airflow (se customizado)
│   └── requirements.yaml      # Dependências de charts
├── airflow/                   # Projeto Airflow (DAGs, plugins, Dockerfile)
│   ├── dags/                  # DAGs de pipelines de dados
│   ├── plugins/               # Plugins customizados
│   └── README.md              # Documentação do Airflow
├── scripts/                   # Scripts utilitários
│   ├── port-forward-argocd.sh # Faz port-forward para acessar o ArgoCD
│   ├── get-admin-password.sh  # Recupera senha inicial do ArgoCD
│   └── setup.sh               # Executa o provisionamento completo
└── ci/                        # Arquivos de CI/CD
    └── github-actions.yaml    # Pipeline para GitHub Actions

```

## Como usar

1. Configure o kubeconfig para seu cluster Minikube.
2. Inicie o Minikube:
   ```sh
   minikube start
   ```
3. Execute o setup:
   ```sh
   ./scripts/setup.sh
   ```
4. Use os scripts utilitários para acessar o ArgoCD e Airflow.

## Dicas e informações úteis

- Para acessar o dashboard do ArgoCD, utilize o script de port-forward e recupere a senha com o script dedicado.
- Os arquivos de variáveis em `infra/env/` permitem fácil troca de ambientes.
- Os módulos em `infra/modules/` facilitam a reutilização e manutenção do código.
- O diretório `charts/` pode ser usado para customizar charts ou adicionar dependências.
- O diretório `airflow/` está pronto para receber DAGs e plugins customizados.
- Pipelines de CI/CD já estão prontos para integração contínua.

## Objetivo

Facilitar o aprendizado e a prática de infraestrutura como código, GitOps e automação de ambientes Kubernetes locais, com foco em DataOps.

## Como usar

1. Configure o kubeconfig para seu cluster Minikube.
2. Execute o setup:
   ```sh
   ./scripts/setup.sh
   ```
3. Use os scripts utilitários para acessar o ArgoCD e Airflow.

## Objetivo

Facilitar o aprendizado e a prática de infraestrutura como código, GitOps e automação de ambientes Kubernetes locais, com foco em DataOps.

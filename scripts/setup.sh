#!/bin/bash
# ATENÇÃO: Execute este script SEMPRE a partir da raiz do projeto (minikube-argocd-terraform)
set -e

# Garante execução a partir da raiz do projeto
if [ ! -f "infra/main.tf" ]; then
  echo "Execute este script a partir da raiz do projeto (minikube-argocd-terraform)."
  exit 1
fi

echo "Configurando KUBECONFIG para Minikube..."
export KUBECONFIG=$HOME/.kube/config
echo "KUBECONFIG definido para: $KUBECONFIG"
echo "Inicializando Terraform..."
terraform -chdir=infra init

echo "Validando plano de execução..."
terraform -chdir=infra plan -var-file=env/dev.tfvars -out=tfplan.out
if [ $? -eq 0 ]; then
  echo "Plano válido. Aplicando infraestrutura..."
  terraform -chdir=infra apply tfplan.out
else
  echo "Erro na validação do plano. Corrija os problemas antes de aplicar."
  exit 1
fi
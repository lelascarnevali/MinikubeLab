# Minikube + ArgoCD + Terraform

Este projeto provisiona o ArgoCD em um cluster Minikube usando Terraform e Helm, facilitando o gerenciamento de aplicações Kubernetes via GitOps em ambiente local.

---

## Pré-requisitos

- [Minikube](https://minikube.sigs.k8s.io/docs/) instalado e rodando
- [kubectl](https://kubernetes.io/docs/tasks/tools/) configurado para o contexto do Minikube
- [Helm](https://helm.sh/docs/intro/install/) instalado
- [Terraform](https://www.terraform.io/downloads.html) instalado

---

## Estrutura do Projeto

```
workingdir/
├── main.tf                # Recursos principais e chamada do módulo ArgoCD
├── providers.tf           # Configuração dos providers Kubernetes e Helm
├── data.tf                # Data sources (ex: secrets)
├── modules/
│   └── helm/
│       └── argocd/        # Módulo reutilizável para deploy do ArgoCD via Helm
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
└── README.md              # Este guia
```

---

## Passo a Passo

### 1. Inicie o Minikube

```sh
minikube start
```

### 2. (Opcional) Verifique o contexto do kubectl

```sh
kubectl config current-context
# Deve retornar: minikube
```

### 3. Inicialize e aplique o Terraform

```sh
cd workingdir
terraform init
terraform apply
```

Aguarde até que todos os recursos sejam criados.

---

## Acesso ao ArgoCD

- **URL do ArgoCD:**
  
  https://localhost:30443

- **Port-forward:**
  
  Execute em um terminal separado:
  
  ```sh
  kubectl -n argocd port-forward svc/argocd-server 30443:443
  ```
  Isso permitirá acessar o ArgoCD via navegador em https://localhost:30443

- **Usuário padrão:**
  
  `admin`

- **Senha do admin:**
  
  Para obter a senha inicial:
  
  ```sh
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
  ```
  
  Se preferir, veja o segredo completo e decodifique manualmente:
  
  ```sh
  kubectl -n argocd get secret argocd-initial-admin-secret -o yaml
  # Copie o valor de 'password' e rode:
  echo '<valor_base64>' | base64 --decode; echo
  ```

---

## Dicas e Observações

- Aguarde alguns minutos após o deploy para o segredo ser criado.
- Se necessário, redefina a senha do admin:
  ```sh
  kubectl -n argocd patch secret argocd-initial-admin-secret -p '{"stringData": {"password": "SENHA_NOVA"}}'
  ```
- Para destruir todos os recursos criados:
  ```sh
  terraform destroy
  ```
- Para ver o status do Minikube:
  ```sh
  minikube status
  ```
- Para ver os pods do ArgoCD:
  ```sh
  kubectl -n argocd get pods
  ```

---

## Sobre o Projeto

Este projeto é um exemplo prático para quem deseja aprender a integrar Minikube, ArgoCD, Helm e Terraform em um ambiente local, com código modular e boas práticas de organização.

Fique à vontade para adaptar, expandir e contribuir!

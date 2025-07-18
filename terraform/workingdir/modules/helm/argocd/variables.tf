## Variável para o namespace onde o ArgoCD será instalado
variable "namespace" {
  type = string
}

## Versão do chart Helm do ArgoCD
variable "chart_version" {
  type    = string
  default = "8.1.2"
}

## Porta NodePort HTTPS do ArgoCD
variable "nodeport_https" {
  type    = string
  default = "30443"
}

## Dependência para garantir que o namespace já existe
variable "namespace_depends_on" {
  description = "Resource to depend on for namespace creation"
  type        = any
}

variable "namespace" {
  description = "Namespace do ArgoCD"
  type        = string
}
variable "repository" {
  description = "Repositório Helm do ArgoCD"
  type        = string
}
variable "chart_version" {
  description = "Versão do chart do ArgoCD"
  type        = string
}
variable "nodeport_https" {
  description = "NodePort para HTTPS do ArgoCD"
  type        = number
}
variable "namespace_depends_on" {
  description = "Dependência do namespace"
  type        = any
}

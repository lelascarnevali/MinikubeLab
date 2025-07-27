variable "kubeconfig_path" {
  description = "Caminho para o kubeconfig do cluster"
  type        = string
}

variable "argocd_namespace" {
  default     = "argocd"
}
variable "argocd_repository" {
  default     = "https://argoproj.github.io/argo-helm"
}
variable "argocd_chart_version" {
  default     = "5.51.6"
}
variable "argocd_nodeport_https" {
  default     = 32080
}

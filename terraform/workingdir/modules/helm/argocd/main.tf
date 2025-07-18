## Helm release do ArgoCD
resource "helm_release" "argocd" {
  name       = "argocd" # Nome do release Helm
  namespace  = var.namespace # Namespace onde o ArgoCD será instalado

  repository = "https://argoproj.github.io/argo-helm" # Repositório oficial do Argo Helm
  chart      = "argo-cd" # Nome do chart
  version    = var.chart_version # Versão do chart

  # Configura o serviço do ArgoCD como NodePort
  set {
    name  = "server.service.type"
    value = "NodePort"
  }
  set {
    name  = "server.service.nodePort.https"
    value = var.nodeport_https
  }

  # Garante que o namespace já existe antes do deploy
  depends_on = [var.namespace_depends_on]
}

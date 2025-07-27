resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = var.namespace
  repository = var.repository
  chart      = "argo-cd"
  version    = var.chart_version

  set {
    name  = "server.service.type"
    value = "NodePort"
  }
  set {
    name  = "server.service.nodePort.https"
    value = var.nodeport_https
  }

  depends_on = [var.namespace_depends_on]
}

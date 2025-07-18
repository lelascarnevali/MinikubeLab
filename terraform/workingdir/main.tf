resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = "argocd" # Nome do Namespace
  }
}


module "argocd" {
  source               = "./modules/helm/argocd"
  namespace            = kubernetes_namespace.argocd_namespace.metadata[0].name
  chart_version        = "8.1.2"
  nodeport_https       = "30443"
  namespace_depends_on = kubernetes_namespace.argocd_namespace
}

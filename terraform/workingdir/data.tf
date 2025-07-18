data "kubernetes_secret" "argocd_initial_admin_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = kubernetes_namespace.argocd_namespace.metadata[0].name
  }
  depends_on = [kubernetes_namespace.argocd_namespace]
}
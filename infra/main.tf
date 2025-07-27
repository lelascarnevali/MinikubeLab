// Chama módulos e define recursos principais
// ...exemplo de chamada de módulos...
module "k8s_namespace" {
  source     = "./modules/k8s_namespace"
  namespaces = [var.argocd_namespace, var.airflow_namespace]
}

module "argocd" {
  source              = "./modules/helm/argocd"
  namespace           = var.argocd_namespace
  repository          = var.argocd_repository
  chart_version       = var.argocd_chart_version
  nodeport_https      = var.argocd_nodeport_https
  namespace_depends_on = module.k8s_namespace
}

module "airflow" {
  source              = "./modules/helm/airflow"
  namespace           = var.airflow_namespace
  repository          = var.airflow_repository
  chart_version       = var.airflow_chart_version
  namespace_depends_on = module.k8s_namespace
}

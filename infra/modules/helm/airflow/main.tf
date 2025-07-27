resource "helm_release" "airflow" {
  name       = "airflow"
  namespace  = var.namespace
  repository = var.repository
  chart      = "airflow"
  version    = var.chart_version

  depends_on = [var.namespace_depends_on]
}

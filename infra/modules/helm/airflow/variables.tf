variable "namespace" {
  description = "Namespace do Airflow"
  type        = string
}
variable "repository" {
  description = "Repositório Helm do Airflow"
  type        = string
}
variable "chart_version" {
  description = "Versão do chart do Airflow"
  type        = string
}
variable "namespace_depends_on" {
  description = "Dependência do namespace"
  type        = any
}

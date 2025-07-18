## Output com o nome do release Helm do ArgoCD
output "argocd_release_name" {
  value = helm_release.argocd.name
}

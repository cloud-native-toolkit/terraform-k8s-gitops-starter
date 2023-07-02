
output "argocd_namespace" {
  description = "The namespace where the ArgoCD instance has been provisioned"
  value       = module.gitops_install.argocd_namespace
}

output "argocd_service_account" {
  description = "The namespace where the ArgoCD instance has been provisioned"
  value       = module.gitops_install.argocd_service_account
}

output "sealed_secrets_cert" {
  value = module.gitops_install.sealed_secrets_cert
}

output "sync" {
  value       = module.bootstrap.sync
}

# Gitops stater module

Module that provisions Gitops tools (ArgoCD, and Kube Seal) in the target cluster and bootstraps the ArgoCD environment 
with a GitOps repository. This module assumes that a direct connection to the cluster is availble in order to deploy the
services and configure the ArgoCD instance.

## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v15

### Terraform providers

None

## Module dependencies

This module makes use of the output from other modules:

- Cluster
    - interface: github.com/cloud-native-toolkit/automation-modules#cluster
- OLM 
    - github.com/cloud-native-toolkit/terraform-k8s-olm
- GitOps 
    - github.com/cloud-native-toolkit/terraform-tools-gitops
- Sealed Secret Cert 
    - github.com/cloud-native-toolkit/terraform-util-sealed-secret-cert

## Example usage

[Refer the test cases for this module](example) 

```hcl-terraform
module "gitops_starter" {
  source = "github.com/cloud-native-toolkit/terraform-k8s-gitops-starter.git"

  cluster_type        = module.dev_cluster.platform.type_code
  ingress_subdomain   = module.dev_cluster.platform.ingress
  cluster_config_file = module.dev_cluster.config_file_path
  olm_namespace       = module.dev_software_olm.olm_namespace
  operator_namespace  = module.dev_software_olm.target_namespace
  gitops_repo_url     = module.gitops.config_repo_url
  git_username        = module.gitops.config_username
  git_token           = module.gitops.config_token
  bootstrap_path      = module.gitops.bootstrap_path
  sealed_secret_cert  = module.cert.cert
  sealed_secret_private_key = module.cert.private_key
  create_webhook      = true
}
```


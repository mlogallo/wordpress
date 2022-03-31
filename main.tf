#__________________________________________________________
#
# Get Outputs from the kubeconfig Workspace
#__________________________________________________________

data "terraform_remote_state" "kubeconfig" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_workspace
    }
  }
}

locals {
  # IKS Cluster Name
  cluster_name = data.terraform_remote_state.kubeconfig.outputs.cluster_name
  # Kubernetes Configuration File
  kubeconfig = yamldecode(data.terraform_remote_state.kubeconfig.outputs.kubeconfig)
}

#_____________________________________________________________________
#
# Deploy the Hello-Kubernetes Application Pod using the Helm Provider
#_____________________________________________________________________

resource "helm_release" "mediawiki" {
  name      = "mediawiki"
  namespace = "mediawikins"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mediawiki"
  set {
    name  = "MESSAGE"
    value = "Hello Intersight Kubernetes Service from Terraform Cloud for Business!!"
  }
}

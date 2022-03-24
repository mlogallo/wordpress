#__________________________________________________________
#
# Terraform Cloud Organization
#__________________________________________________________

variable "tfc_organization" {
  default     = "Netnology-MINT"
  description = "Terraform Cloud Organization."
  type        = string
}


#______________________________________________
#
# Terraform Cloud kubeconfig Workspace
#______________________________________________

variable "ws_kubeconfig" {
  default     = ""
  description = "Intersight Kubernetes Service (IKS) kubeconfig Workspace Name.  The default value will be set to {cluster_name}_kubeconfig by the tfe variable module."
  type        = string
}
#______________________________________________
#
# Terraform Cloud kubeconfig Workspace
#______________________________________________

variable "tfc_workspace" {
  default     = "kubeconfig"
  description = "Intersight Kubernetes Service (IKS) kubeconfig Workspace Name.  The default value will be set to {cluster_name}_kubeconfig by the tfe variable module."
  type        = string
}

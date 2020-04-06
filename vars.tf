variable "namespace" {
  type        = string
  description = "Namespace (i.e. `anarkio`)"
}

variable "stage" {
  type        = string
  description = "Stage (i.e. `dev`, `stg`, `prd`, `infra`)"
}

variable "name" {
  type        = string
  description = "Name of solution"
  default     = "external-dns"
}

variable "external_dns_oidc_fully_qualified_subject" {
  type        = string
  description = "Service account OIDC FQS for external-dns (leave as default when module paired with `terraform-helm-external-dns`)"
  default     = "system:serviceaccount:external-dns:external-dns"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name where external-dns resides"
}

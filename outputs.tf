output "eks_iam_role_name" {
  description = "Name of ExternalDNS EKS IAM service account role"
  value = module.eks_iam_role.eks_iam_role_name
}

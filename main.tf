module "grant_permissions_iam_policy_label" {
  source    = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name
}

resource "aws_iam_policy" "grant_permissions" {
  name        = module.grant_permissions_iam_policy_label.id
  description = "Grant permissions for external-dns"
  policy      = data.aws_iam_policy_document.grant_permissions.json
}

module "eks_iam_role" {
  source    = "git::https://github.com/anarkioteam/terraform-aws-eks-iam-role.git?ref=master"
  namespace = var.namespace
  stage     = var.stage
  name      = var.name

  eks_cluster_name = var.eks_cluster_name

  oidc_fully_qualified_subjects = [var.external_dns_oidc_fully_qualified_subject]
  role_policy_arns              = [aws_iam_policy.grant_permissions.arn]
}

data "aws_iam_policy_document" "grant_permissions" {
  statement {
    sid = "GrantModifyAccessToDomains"

    actions = [
      "route53:ChangeResourceRecordSets",
    ]

    effect = "Allow"

    resources = formatlist("arn:aws:route53:::hostedzone/%s", var.hosted_zone_ids)
  }

  statement {
    sid = "GrantListAccessToDomains"

    actions = [
      "route53:ListHostedZones",
      "route53:ListResourceRecordSets",
    ]

    effect = "Allow"

    resources = ["*"]
  }
}

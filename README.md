# terraform-aws-eks-iam-external-dns-role

A Terraform module for creating an ExternalDNS EKS IAM service account role.

## Requirements

| Name      | Version   |
| --------- | --------- |
| terraform | ~> 0.12.0 |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | n/a     |

## Inputs

| Name                                      | Description                                                                                                        | Type           | Default                                             | Required |
| ----------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | -------------- | --------------------------------------------------- | :------: |
| eks_cluster_name                          | EKS cluster name where external-dns resides                                                                        | `string`       | n/a                                                 |   yes    |
| external_dns_oidc_fully_qualified_subject | Service account OIDC FQS for external-dns (leave as default when module paired with `terraform-helm-external-dns`) | `string`       | `"system:serviceaccount:external-dns:external-dns"` |    no    |
| hosted_zone_ids                           | List of hosted zone ids                                                                                            | `list(string)` | n/a                                                 |   yes    |
| name                                      | Name of solution                                                                                                   | `string`       | `"external-dns"`                                    |    no    |
| namespace                                 | Namespace (i.e. `anarkio`)                                                                                         | `string`       | n/a                                                 |   yes    |
| stage                                     | Stage (i.e. `dev`, `stg`, `prd`, `infra`)                                                                          | `string`       | n/a                                                 |   yes    |

## Outputs

| Name              | Description                                      |
| ----------------- | ------------------------------------------------ |
| eks_iam_role_name | Name of ExternalDNS EKS IAM service account role |

# Sierra Scanner Terraform Module

## Introduction

This module is provided for use by customers of Relyance AI. Visit relyance.ai to learn more about our services.

## Usage

When you have agreed to sign up for Sierra, this module will create the scanner role, and its associated policy, 
needed to run the scanner in the desired AWS account.

The module would be used separately for each AWS account you want the scanner to have access to.

## Resources Created

All resources will have the tag relyance-sierra set to the module version.
* An AWS IAM Role
* An AWS IAM Role Policy (inline)

<!-- Everything below this line is output from terraform-docs tool -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.scanner](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.scanner_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | base name for all resources | `string` | `"Relyance_Sierra"` | no |
| <a name="input_kms_key_arns"></a> [kms\_key\_arns](#input\_kms\_key\_arns) | KMS key ARNs used to encrypt S3 buckets. | `list(string)` | n/a | yes |
| <a name="input_main_role_arn"></a> [main\_role\_arn](#input\_main\_role\_arn) | The main worker role ARN to allow assume access from. | `string` | `null` | no |
| <a name="input_s3_bucket_arns"></a> [s3\_bucket\_arns](#input\_s3\_bucket\_arns) | S3 bucket ARNs to be scanned. Set to ["*"] to allow access to all S3 buckets in the account. | `list(string)` | n/a | yes |
| <a name="input_scanner_external_id"></a> [scanner\_external\_id](#input\_scanner\_external\_id) | The external ID associated with the scanner role that will be used to scan the S3 scan bucket. | `string` | `"relyance-scanner"` | no |
| <a name="input_sierra_account_id"></a> [sierra\_account\_id](#input\_sierra\_account\_id) | The account ID where the core Sierra environment is deployed. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

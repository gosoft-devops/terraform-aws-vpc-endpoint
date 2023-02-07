<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.53 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.vpce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.vpce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_security_group.vpce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_vpc_endpoint.vpce](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_subnets.secure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.lz](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_createby"></a> [createby](#input\_createby) | Who has perform this operation, Please type your UserLan. (กรุณาพิมพ์ User Lan ของคุณ) | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Short service name (either "s3" or "dynamodb"), or fulle service name endpoint | `string` | n/a | yes |
| <a name="input_tag_owner"></a> [tag\_owner](#input\_tag\_owner) | The resource owner id. | `string` | n/a | yes |
| <a name="input_tag_project"></a> [tag\_project](#input\_tag\_project) | The project name. | `string` | n/a | yes |
| <a name="input_tag_service"></a> [tag\_service](#input\_tag\_service) | The Service code id. | `string` | n/a | yes |
| <a name="input_tag_system"></a> [tag\_system](#input\_tag\_system) | The System code id. | `string` | n/a | yes |
| <a name="input_vpc_ids"></a> [vpc\_ids](#input\_vpc\_ids) | The list of VPC IDs, This module will create a vpc endpoint in each vpcs as defined in the list. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the VPC endpoint. |
| <a name="output_dns_entry"></a> [dns\_entry](#output\_dns\_entry) | The DNS entries for the VPC Endpoint. |
| <a name="output_eni_ids"></a> [eni\_ids](#output\_eni\_ids) | One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the VPC endpoint. |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | The ID lists of security group. |
<!-- END_TF_DOCS -->

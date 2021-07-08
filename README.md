# S3 + Cloudfront SPA
<img src="https://github.com/Landon-Davidson/s3-spa/extra_assets/Platform_FTE_Exercise_Architecture.svg">

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_route53_record.recs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aliases"></a> [aliases](#input\_aliases) | Optional alternative domain names. | `list(string)` | `[]` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | CORS rules for the bucket, if applicable. | <pre>set(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `[]` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Tags to add to all resources. | `map(any)` | `{}` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for accessing the bucket. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment type (dev, staging, prod, etc.) | `string` | n/a | yes |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | HTML page to display on 4XX errors (defaults to error.html). | `string` | `"error.html"` | no |
| <a name="input_routing_rules"></a> [routing\_rules](#input\_routing\_rules) | JSON array of routing rules for paths in the S3 bucket. | `string` | `""` | no |
| <a name="input_web_acl_id"></a> [web\_acl\_id](#input\_web\_acl\_id) | ARN of WAFv2 ACL or ID of WAFv1 ACL if desired. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN of the s3 bucket. |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | ID of the S3 bucket. |
<!-- END_TF_DOCS -->
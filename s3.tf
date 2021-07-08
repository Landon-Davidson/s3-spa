resource "aws_s3_bucket" "host" {
  bucket = local.bucket_name
  acl    = "public-read" # assuming this is a public SPA, based off of instructions

  website {
    index_document = "index.html" # The instruction doc lists this as index.html (along with other web resources/imports), so leave hard-coded for now
    error_document = var.error_document
    routing_rules  = var.routing_rules
  }

  tags = merge({
    "Environment" = var.environment
  }, var.default_tags)

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      allowed_headers = cors_rule.value.allowed_headers
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = cors_rule.value.expose_headers
      max_age_seconds = cors_rule.value.max_age_seconds
    }
  }
}
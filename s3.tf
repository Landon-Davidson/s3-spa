resource "aws_s3_bucket" "host" {
    bucket = local.bucket_name
    acl    = "public-read" # assuming this is a public SPA, based off of instructions

    website {
        index_document = "index.html" # The instruction doc lists this as index.html (along with other web resources/imports), so leave hard-coded for now
        error_document = var.error_document
        routing_rules = var.routing_rules
    }

    tags = merge({
        "Environment" = var.environment
    }, var.default_tags)

    # TODO: cors_rule {

    # }   
}
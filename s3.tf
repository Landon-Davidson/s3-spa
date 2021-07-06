locals {
    # for now, allow user to specify bucket name or infer it
    # TODO: come up with sensible default bucket name based on provided inputs, otherwise change bucket_name to required
    bucket_name = var.bucket_name == "" ? "sensible-default-asdasd" : var.bucket_name
}

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
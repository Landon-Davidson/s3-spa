locals {
    # locals that are shared between the config files

    # for now, allow user to specify bucket name or infer it
    # TODO: come up with sensible default bucket name based on provided inputs, otherwise change bucket_name to required
    # bucket_name_prefix = var.bucket_name_prefix == "" ? "sensible-default-asdasd" : var.bucket_name_prefix
    # bucket_name = "${local.bucket_name_prefix}-${var.environment}"
    bucket_name = var.domain_name
}
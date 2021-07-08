locals {
  # locals that are shared between the config files
  # Inferred based on the domain name for now.
  bucket_name = var.domain_name
}
variable "bucket_name" {
    type = string
    description = "Name for the S3 bucket."
    default = ""
}

variable "error_document" {
    type = string
    description = "HTML page to display on 4XX errors (defaults to error.html)."
    default = "error.html"
}

variable "routing_rules" {
    type = string
    description = "JSON array of routing rules for paths in the S3 bucket."
    default = ""
}

variable "default_tags" {
    type = map(any)
    description = "Tags to add to all resources."
    default = {}
}

variable "environment" {
  type = string
  description = "Environment type (dev, staging, prod, etc.)"
}
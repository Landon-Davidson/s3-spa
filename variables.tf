variable "aliases" {
  type        = list(string)
  description = "Optional alternative domain names."
  default     = []
}

variable "cors_rules" {
  type = set(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  description = "CORS rules for the bucket, if applicable."
  default     = []
}

variable "default_tags" {
  type        = map(any)
  description = "Tags to add to all resources."
  default     = {}
}

variable "domain_name" {
  type        = string
  description = "Domain name for accessing the bucket."
}

variable "environment" {
  type        = string
  description = "Environment type (dev, staging, prod, etc.)"
}

variable "error_document" {
  type        = string
  description = "HTML page to display on 4XX errors (defaults to error.html)."
  default     = "error.html"
}

variable "routing_rules" {
  type        = string
  description = "JSON array of routing rules for paths in the S3 bucket."
  default     = ""
}

variable "web_acl_id" {
  type        = string
  description = "ARN of WAFv2 ACL or ID of WAFv1 ACL if desired."
  default     = ""
}
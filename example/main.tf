locals {
  domain_name = "platftetakehome${var.environment}.com"
}

module "spa" {
  source      = "../../s3-spa"
  environment = var.environment
  domain_name = local.domain_name
  cors_rules = [{
    #   TODO: API gateway call...
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }]
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = module.spa.bucket_id
  /* Depending on the use case, this could be split to be different per environment,
     but the person creating the config for the s3-spa module is still in control.
  */
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "placeholderpolicy"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          "${module.spa.bucket_arn}/*",
        ]
      },
  ] })
}

# This is for demonstration purposes, typically this should be deployed through a CI/CD pipeline
resource "aws_s3_bucket_object" "index" {
  # Arn doesn't seem to work here and the bucket resource doesn't output the name
  depends_on = [
    module.spa.bucket
  ]
  bucket = local.domain_name
  key    = "index.html"
  source = "./dummy_content/index.html"
  etag   = filemd5("./dummy_content/index.html")
}

# This is for demonstration purposes, typically this should be deployed through a CI/CD pipeline
resource "aws_s3_bucket_object" "error" {
  # Arn doesn't seem to work here and the bucket resource doesn't output the name
  depends_on = [
    module.spa.bucket
  ]
  bucket = local.domain_name
  key    = "error.html"
  source = "./dummy_content/error.html"
  etag   = filemd5("./dummy_content/error.html")
}
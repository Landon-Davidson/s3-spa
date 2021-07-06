
module "spa" {
    source = "../../s3-spa"
    environment = var.environment
}

resource "aws_s3_bucket_policy" "policy" {
  bucket = module.spa.bucket_id
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
    ]})
}
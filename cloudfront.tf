resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.host.bucket_regional_domain_name
    origin_id   = var.domain_name

    # s3_origin_config {
    #     # TODO...
    #   origin_access_identity = "origin-access-identity/cloudfront/ABCDEFG1234567"
    # }
  }

  enabled             = true
  comment             = "${local.bucket_name} bucket for ${var.environment} env."
  default_root_object = "index.html"

  #   logging_config {
  #     TODO.... should be configured as part of module, no time now
  #   }

  aliases = concat([var.domain_name], var.aliases)

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.domain_name

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100" # Save cost for demo... 

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = merge({
    "Environment" = var.environment
  }, var.default_tags)

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.cert.arn
    ssl_support_method  = "sni-only"
  }

  web_acl_id = var.web_acl_id
}
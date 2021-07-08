output "bucket_id" {
  value       = aws_s3_bucket.host.id
  description = "ID of the S3 bucket."
}

output "bucket_arn" {
  value       = aws_s3_bucket.host.arn
  description = "ARN of the s3 bucket."
}
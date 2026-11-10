locals {
  bucket_name = "${var.owner}-bucket-state-${time_static.this.unix}"
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
    Owner       = var.owner
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_ssm_parameter" "state_bucket" {
  name  = "/ephemeral-aws-sandbox/tfstate/bucket_name"
  type  = "String"
  value = aws_s3_bucket.this.bucket
}
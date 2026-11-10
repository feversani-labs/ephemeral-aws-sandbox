output "bucket_name" {
  description = "Nombre del bucket S3 generado para el backend de estado"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.this.arn
}

output "backend_config_snippet" {
  description = "Bloque de configuración de backend listo para copiar en otros repositorios"
  value       = <<-EOT
terraform {
  backend "s3" {
    bucket = "${aws_s3_bucket.this.bucket}"
    key    = "ruta/a/tu/terraform.tfstate"
    region = "${var.region}"
  }
}
EOT
}


output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.this.arn
}

output "backend_config_snippet" {
  description = "Bloque de configuración de backend listo para copiar en otros repositorios"
  value       = <<-EOT
terraform {
  backend "s3" {
    bucket = "${aws_s3_bucket.this.bucket}"
    key    = "ruta/a/tu/terraform.tfstate"
    region = "${var.region}"
  }
}
EOT
}
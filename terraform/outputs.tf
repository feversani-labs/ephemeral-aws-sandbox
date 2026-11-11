output "bucket_name" {
  description = "Nombre del bucket S3 generado para el backend de estado"
  value       = aws_s3_bucket.this.bucket
}

output "bucket_arn" {
  description = "ARN del bucket S3"
  value       = aws_s3_bucket.this.arn
}

output "ssm_parameter_name" {
  description = "Nombre del parámetro SSM que almacena el nombre del bucket"
  value       = aws_ssm_parameter.state_bucket.name
}

output "backend_config" {
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
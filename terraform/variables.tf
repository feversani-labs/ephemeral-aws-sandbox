
variable "aws_access_key" {
  type = string
  sensitive = true
}

variable "aws_secret_key" {
  type = string
  sensitive = true
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "owner" {
  type    = string
  default = "fvrsn"
}

variable "environment" {
  type    = string
  default = "sandbox"
}
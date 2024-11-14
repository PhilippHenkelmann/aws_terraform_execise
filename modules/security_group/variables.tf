variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_ssh_cidr" {
  description = "Public SSH CIDR block"
  type        = string
}

variable "public_ingress_ports" {
  description = "Public ingress ports"
  type        = list(number)
}

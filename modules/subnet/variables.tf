variable "vpc_id" {
  description = "ID der VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR Block für das öffentliche Subnetz"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR Block für das private Subnetz"
  type        = string
}

variable "availability_zone_a" {
  description = "Verfügbarkeitszone A für das öffentliche Subnetz"
  type        = string
}

variable "availability_zone_b" {
  description = "Verfügbarkeitszone B für das private Subnetz"
  type        = string
}

# Datei: variables.tf

variable "region" {
  description = "AWS-Region für Bereitstellung"
  type        = string
  default     = "us-west-2"
}

variable "ami_id" {
  description = "AMI ID für EC2-Instanzen"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Beispiel-AMI
}

variable "instance_type" {
  description = "Instanztyp für EC2-Instanzen"
  type        = string
  default     = "t2.micro"
}

variable "vpc_cidr" {
  description = "CIDR Block für die VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR Block für das öffentliche Subnetz"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR Block für das private Subnetz"
  type        = string
  default     = "10.0.2.0/24"
}

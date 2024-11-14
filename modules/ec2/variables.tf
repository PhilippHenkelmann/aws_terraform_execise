variable "ami_id" {
  description = "AMI ID für EC2-Instanz"
  type        = string
}

variable "instance_type" {
  description = "EC2-Instanztyp"
  type        = string
}

variable "public_subnet_id" {
  description = "ID des öffentlichen Subnetzes"
  type        = string
}

variable "private_subnet_id" {
  description = "ID des privaten Subnetzes"
  type        = string
}

variable "public_sg_id" {
  description = "ID der öffentlichen Sicherheitsgruppe"
  type        = string
}

variable "private_sg_id" {
  description = "ID der privaten Sicherheitsgruppe"
  type        = string
}

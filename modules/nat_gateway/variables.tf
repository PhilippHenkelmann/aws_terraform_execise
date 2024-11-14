variable "subnet_id" {
  description = "ID des Subnetzes, in dem das NAT-Gateway platziert wird"
  type        = string
}

variable "allocation_id" {
  description = "Elastic IP ID, die dem NAT-Gateway zugewiesen wird"
  type        = string
}

variable "private_route_table_id" {
  description = "ID der privaten Route-Tabelle, zu der die Route hinzugefügt wird"
  type        = string
}

variable "name" {
  description = "Name des NAT-Gateways"
  type        = string
}

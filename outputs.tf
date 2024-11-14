# outputs.tf

# Ausgabe der Internet Gateway ID
output "igw_id" {
  value = aws_internet_gateway.example.id
}

# Ausgabe der öffentlichen Route-Tabelle ID
output "public_route_table_id" {
  value = aws_route_table.public.id
}


# Ausgabe der privaten Route-Tabelle ID
output "private_route_table_id" {
  value = aws_route_table.private.id
}

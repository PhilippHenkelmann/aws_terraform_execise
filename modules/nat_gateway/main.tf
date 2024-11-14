# Elastic IP für das NAT-Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT-Gateway im öffentlichen Subnetz
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = module.subnet.public_subnet_id
  depends_on    = [aws_eip.nat]  # Abhängigkeit von der Elastic IP
}

# Route-Tabelle für das private Subnetz
resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id  # Weiterleitung über das NAT-Gateway
  }

  depends_on = [aws_nat_gateway.example]  # Abhängigkeit, dass das NAT-Gateway erstellt wird
}

# Route-Tabelle mit privaten Subnetz zuordnen
resource "aws_route_table_association" "private" {
  subnet_id      = module.subnet.private_subnet_id
  route_table_id = aws_route_table.private.id
}

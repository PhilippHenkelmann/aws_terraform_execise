resource "aws_security_group" "public" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.public_ingress_ports[0]
    to_port     = var.public_ingress_ports[1]
    protocol    = "tcp"
    cidr_blocks = [var.public_ssh_cidr]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "private-sg"
  }
}

output "public_sg_id" {
  value = aws_security_group.public.id
}

output "private_sg_id" {
  value = aws_security_group.private.id
}

resource "aws_instance" "public" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  security_groups = [var.public_sg_id]

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  security_groups = [var.private_sg_id]

  tags = {
    Name = "private-instance"
  }
}

output "ec2_public_instance_id" {
  value = aws_instance.public.id
}

output "ec2_private_instance_id" {
  value = aws_instance.private.id
}

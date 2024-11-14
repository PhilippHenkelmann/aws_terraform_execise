# Datei: main.tf

provider "aws" {
  region = var.region
}

# VPC-Modul
module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  name     = "my-vpc"
}

# Subnetz-Modul
module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone_a = "us-west-2a"
  availability_zone_b = "us-west-2b"
}

# Sicherheitsgruppen-Modul
module "security_group" {
  source               = "./modules/security_group"
  vpc_id               = module.vpc.vpc_id
  public_ssh_cidr      = "0.0.0.0/0"
  public_ingress_ports = [22, 80, 443]
}

# EC2-Instanzen-Modul
module "ec2" {
  source             = "./modules/ec2"
  public_subnet_id   = module.subnet.public_subnet_id
  private_subnet_id  = module.subnet.private_subnet_id
  public_sg_id       = module.security_group.public_sg_id
  private_sg_id      = module.security_group.private_sg_id
  ami_id             = var.ami_id
  instance_type      = var.instance_type
}

# Elastic IP für NAT-Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
}

# NAT-Gateway erstellen
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.nat.id
  subnet_id     = module.subnet.public_subnet_id

  depends_on = [aws_eip.nat]
}

# Route-Tabelle für das private Subnetz
resource "aws_route_table" "private" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.example.id
  }
}

# Route-Tabelle für das private Subnetz zuweisen
resource "aws_route_table_association" "private" {
  subnet_id      = module.subnet.private_subnet_id
  route_table_id = aws_route_table.private.id
}

# Internet-Gateway erstellen
resource "aws_internet_gateway" "example" {
  vpc_id = module.vpc.vpc_id
}

# Route-Tabelle für das öffentliche Subnetz
resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
}

# Route-Tabelle für das öffentliche Subnetz zuweisen
resource "aws_route_table_association" "public" {
  subnet_id      = module.subnet.public_subnet_id
  route_table_id = aws_route_table.public.id
}

# Create Network
## Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
## Public Subnet
### Create Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnets[count.index].cidr
  availability_zone       = var.public_subnets[count.index].az
  map_public_ip_on_launch = true

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
### Create A Route Table for Public Subnets
resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
### Associate Route Table for Public Subnets
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route.id
}
## Protected Subnet
### Create Protected Subnet
resource "aws_subnet" "protected_subnet" {
  count                   = length(var.protected_subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.protected_subnets[count.index].cidr
  availability_zone       = var.protected_subnets[count.index].az
  map_public_ip_on_launch = false

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
### Create EIP for NAT Gateways
resource "aws_eip" "eip_nat_gateway" {
  count      = length(aws_subnet.protected_subnet)
  vpc        = true
  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
### Create NAT Gateways
resource "aws_nat_gateway" "nat_gateway" {
  count         = length(aws_subnet.protected_subnet)
  allocation_id = aws_eip.eip_nat_gateway[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id
}
### Create Route Tables for Protected Subnets 
resource "aws_route_table" "protected_route" {
  count  = length(aws_subnet.protected_subnet)
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }
  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}
### Associate Route Table for Protected Subnets
resource "aws_route_table_association" "protected" {
  count          = length(aws_subnet.protected_subnet)
  subnet_id      = aws_subnet.protected_subnet[count.index].id
  route_table_id = aws_route_table.protected_route[count.index].id
}
### Create Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].az

  tags = {
    Name        = format("%s-%s", var.environment, var.component)
    Environment = var.environment
    Component   = var.component
  }
}

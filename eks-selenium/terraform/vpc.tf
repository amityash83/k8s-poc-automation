data "aws_availability_zones" "available" {}

resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16" # IP range for the VPC
  tags = {
    Name        = "${var.cluster_name}-vpc"
    Provisioner = var.provisioner
    owner       = var.owner
    environment = var.environment
  }
}

resource "aws_subnet" "eks_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.eks_vpc.cidr_block, 8, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true # Enable auto-assign public IP

  tags = {
    Name        = "${var.cluster_name}-subnet-${count.index + 1}"
    Provisioner = var.provisioner
    Owner       = var.owner
    Environment = var.environment
  }
}
resource "aws_internet_gateway" "eks_igw" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name        = "${var.cluster_name}-igw"
    Provisioner = var.provisioner
    Owner       = var.owner
    Environment = var.environment
  }
}

resource "aws_route_table" "eks_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks_igw.id
  }

  tags = {
    Name        = "${var.cluster_name}-route"
    Provisioner = var.provisioner
    Owner       = var.owner
    Environment = var.environment
  }
}

resource "aws_route_table_association" "eks_route_table_assoc" {
  count          = 2 # Associates the route table with each subnet
  subnet_id      = element(aws_subnet.eks_subnet.*.id, count.index)
  route_table_id = aws_route_table.eks_route_table.id
}

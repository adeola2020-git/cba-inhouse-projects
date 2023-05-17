provider "aws" {
  region = var.region
}

# locals {
#   public_subnet_bits = 24   # Use 24 bits for public subnets
#   private_subnet_bits = 26  # Use 26 bits for private subnets
# }

data "aws_ami" "latest_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["amazon"]
}

# Get list of availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block                     = var.vpc_cidr
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_support
  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink

  tags = {
    Name = "ak-vpc"
  }
}

# locals {
#   public_subnet_bits = 24   # Use 24 bits for public subnets
#   private_subnet_bits = 26  # Use 26 bits for private subnets
# }

# Create public subnets1
resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  count                   = var.preferred_number_of_public_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_public_subnets

  tags = {
    Name = "project-public-subnet"
  }

}

# Create private subnets1
resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[(count.index)+1]
  count                   = var.preferred_number_of_private_subnets == null ? length(data.aws_availability_zones.available.names) : var.preferred_number_of_private_subnets

  tags = {
    Name = "project-private-subnet"
  }

}



# resource "aws_subnet" "web-public-subnet1" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[0]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet"
#   }

# }

# resource "aws_subnet" "web-public-subnet2" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[1]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet1"
#   }

# }

# resource "aws_subnet" "web-private-subnet1" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[2]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet1"
#   }

# }

# resource "aws_subnet" "web-private-subnet2" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[3]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet1"
#   }

# }

# resource "aws_subnet" "web-private-subnet3" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[4]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet1"
#   }

# }

# resource "aws_subnet" "web-privape-subnet4" {
#   vpc_id                  = aws_vpc.web-vpc.id
#   cidr_block              = var.public_cidr_blocks[5]
#   # availability_zone       = var.azs[0]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "web-public-subnet1"
#   }

# }
# create vpc
resource "aws_vpc" "vpc_dev" {
  cidr_block              = var.vpc_cidr
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "${var.project_name}-vpc-dev"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# INTERNET GATEWAY
#resource type and given name
resource "aws_internet_gateway" "internet_gateway_dev" {
  vpc_id    = aws_vpc.vpc_dev.id

  tags      = {
    Name    = "${var.project_name}-igateway-dev"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# PUBLIC SUBNET AZ1
#resource type and given name
resource "aws_subnet" "public_subnet_dev_az1" {
  vpc_id                  = aws_vpc.vpc_dev.id
  cidr_block              = var.public_subnet_dev_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az1"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# PUBLIC SUBNET AZ2
#resource type and given name
resource "aws_subnet" "public_subnet_dev_az2" {
  vpc_id                  = aws_vpc.vpc_dev.id
  cidr_block              = var.public_subnet_dev_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags      = {
    Name    = "public subnet az2"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# create route table and add public route
#resource type and given name
resource "aws_route_table" "public_route_table_dev" {
  vpc_id       = aws_vpc.vpc_dev.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_dev.id
  }

  tags       = {
    Name     = "public route table"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# associate public subnet az1 to "public route table"
#resource type and given name
resource "aws_route_table_association" "public_subnet_dev_az1_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_dev_az1.id
  route_table_id      = aws_route_table.public_route_table_dev.id
}

# associate public subnet az2 to "public route table"
#resource type and given name
resource "aws_route_table_association" "public_subnet_dev_az2_route_table_association" {
  subnet_id           = aws_subnet.public_subnet_dev_az2.id
  route_table_id      = aws_route_table.public_route_table_dev.id 
}

# private app subnet az1
#resource type and given name
resource "aws_subnet" "private_app_subnet_dev_az1" {
  vpc_id                   = aws_vpc.vpc_dev.id
  cidr_block               = var.private_app_subnet_dev_az1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private app subnet az1"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# create private app subnet az2
#resource type and given name
resource "aws_subnet" "private_app_subnet_dev_az2" {
  vpc_id                   = aws_vpc.vpc_dev.id
  cidr_block               = var.private_app_subnet_dev_az2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private app subnet az2"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# create private data subnet az1
#resource type and given name
resource "aws_subnet" "private_data_subnet_dev_az1" {
  vpc_id                   = aws_vpc.vpc_dev.id
  cidr_block               = var.private_data_subnet_dev_az1_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private data subnet az1"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}

# create private data subnet az2
#resource type and given name
resource "aws_subnet" "private_data_subnet_dev_az2" {
  vpc_id                   = aws_vpc.vpc_dev.id
  cidr_block               = var.private_data_subnet_dev_az2_cidr
  availability_zone        = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private data subnet az2"
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
  }
}
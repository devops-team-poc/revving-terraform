#VPC

resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.tenancy
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        Name = var.vpc_name
    }
}

# Public Subnets

resource "aws_subnet" "main-public-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.pub1_sub_cidr
    map_public_ip_on_launch = "true"
    availability_zone = var.pub1_sub_az
    tags = {
        Name = var.pub1_sub_name
    }
}


#Private Subnets

resource "aws_subnet" "main-private-1" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private1_sub_cidr
    map_public_ip_on_launch = "false"
    availability_zone = var.private1_sub_az
    tags = {
        Name = var.private1_sub_name
    }
}

resource "aws_subnet" "main-private-2" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private2_sub_cidr
    map_public_ip_on_launch = "false"
    availability_zone = var.private2_sub_az

    tags = {
        Name = var.private2_sub_name
    }
}

#Internet Gateway

resource "aws_internet_gateway" "main-gw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = var.IGW_name
    }
}

#route tables

resource "aws_route_table" "main-public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-gw.id
    }

    tags = {
        Name = var.route_table_public_name
    }
}

# route associations public

resource "aws_route_table_association" "main-public-1-a" {
    subnet_id = aws_subnet.main-public-1.id
    route_table_id = aws_route_table.main-public.id
}




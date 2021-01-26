resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true

  tags = {
    Name = "Main EC2 VPC"
  }
}

resource "aws_subnet" "simple-subnet-a" {
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Main EC2 subnet - A"
  }

}

resource "aws_internet_gateway" "ec2-gateway" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "EC2 Internet Gateway"
  }
}

resource "aws_route_table" "emr-cluster-public-routing-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2-gateway.id
  }

  tags = {
    Name = "EC2 Route Table"
  }
}

resource "aws_route_table_association" "public-route-association" {
  subnet_id      = aws_subnet.simple-subnet-a.id
  route_table_id = aws_route_table.emr-cluster-public-routing-table.id
}
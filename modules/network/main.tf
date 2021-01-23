resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"

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

resource "aws_subnet" "simple-subnet-b" {
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Main EC2 subnet - B"
  }

}
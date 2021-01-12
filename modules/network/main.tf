resource "aws_vpc" "main-simple-ad-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "SimpleAD VPC"
  }
}

resource "aws_subnet" "simple-ad-subnet-a" {
  vpc_id = aws_vpc.main-simple-ad-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${var.region}a"

  tags = {
    Name = "Simple AD subnet - A"
  }

}

resource "aws_subnet" "simple-ad-subnet-b" {
  vpc_id = aws_vpc.main-simple-ad-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "${var.region}b"

  tags = {
    Name = "Simple AD subnet - B"
  }

}
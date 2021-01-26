output "ec2_vpc_id" {
  value = aws_vpc.main-vpc.id
}

output "ec2_subnet_id"{
  value = aws_subnet.simple-subnet-a.id
}
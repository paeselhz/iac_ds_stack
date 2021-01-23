output "ec2_vpc_id" {
  value = aws_vpc.main-vpc.id
}

output "ec2_subnet_ids"{
  value = list(aws_subnet.simple-subnet-a.id,
               aws_subnet.simple-subnet-b.id)
}
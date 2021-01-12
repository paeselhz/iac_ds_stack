output "simple_ad_vpc_id" {
  value = aws_vpc.main-simple-ad-vpc.id
}

output "simple_ad_subnet_ids"{
  value = list(aws_subnet.simple-ad-subnet-a.id,
               aws_subnet.simple-ad-subnet-b.id)
}
output "simple_ad_id" {
  value = aws_directory_service_directory.simpleAD.id
}

output "simple_ad_name" {
  value = aws_directory_service_directory.simpleAD.name
}

output "simple_ad_dns_addresses" {
  value = aws_directory_service_directory.simpleAD.dns_ip_addresses
}

output "simple_ad_url" {
  value = aws_directory_service_directory.simpleAD.access_url
}

output "simple_ad_sg" {
  value = aws_directory_service_directory.simpleAD.security_group_id
}
output "id" {
  value = aws_instance.ds-ec2.id
}

output "name" {
  value = aws_instance.ds-ec2.tags.Name
}

output "ec2_public_ip" {
  value = aws_instance.ds-ec2.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.ds-ec2.public_dns
}
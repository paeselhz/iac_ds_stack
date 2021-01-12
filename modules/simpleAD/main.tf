resource "aws_directory_service_directory" "simpleAD" {
  name     = var.ad_name
  password = var.password
  size     = var.ad_size
  type     = "SimpleAD"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = var.subnets_list
  }

  tags = {
    Project = "Simple AD"
  }
}
module "iam"{
  source = "./modules/iam"
}

module "network" {
  source = "./modules/network"
  region = var.region
}

module "security" {
  source = "./modules/security"
  ingress_cidr_blocks = var.ingress_cidr_blocks
  vpc_id = module.network.simple_ad_vpc_id
}

module "simpleAD" {
  source = "./modules/simpleAD"
  ad_name = var.ad_name
  ad_size = var.ad_size
  password = var.ad_password
  subnets_list = module.network.simple_ad_subnet_ids
  vpc_id = module.network.simple_ad_vpc_id
}

module "ssm" {
  source = "./modules/ssm"
  ad_id = module.simpleAD
  instance_ids = module.ec2.id
}

module "ec2" {
  source = "./modules/ec2"
  region = var.region
  ec2_instance_type = var.instance_type
  ec2_ebs_size = var.ebs_size
  ec2_ami = var.ec2_ami
  ec2_iam_instance_profile = module.iam.ec2_instance_profile
  ec2_security_groups = module.security.ec2_sg_id
  subnet_id = module.network.simple_ad_subnet_ids
  vpc_id = module.network.simple_ad_vpc_id
}
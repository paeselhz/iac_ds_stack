
resource "aws_instance" "ds-ec2" {

  ami = var.ec2_ami
  instance_type = var.ec2_instance_type

  availability_zone = "${var.region}a"
  subnet_id = var.subnet_id
  associate_public_ip_address = true

  iam_instance_profile = var.ec2_iam_instance_profile

  key_name = var.key_name

  root_block_device {
    delete_on_termination = true
    volume_size = var.ec2_ebs_size
    volume_type = "gp2"
  }

  security_groups = [var.ec2_security_groups]

  tags = {
    Name = "EC2 Instance"
  }

}
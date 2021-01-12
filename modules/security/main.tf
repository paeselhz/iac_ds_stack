
resource "aws_security_group" "ec2_sg" {

  name = "EC2 Security Group"
  description = "Security Group for Amazon Linux 2"

  vpc_id = var.vpc_id
  revoke_rules_on_delete = true

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

//  RStudio Server Port
  ingress {
    from_port = 8787
    to_port = 8787
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

//  JupyterHub Port
  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = [var.ingress_cidr_blocks]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2_SG"
  }

}

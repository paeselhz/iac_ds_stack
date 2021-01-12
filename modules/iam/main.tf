
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      identifiers = ["ec2.amazonaws.com"]
      type = "Service"
    }

    actions = ["sts:AssumeRole"]

  }
}

resource "aws_iam_role" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_role_policy_attachment" "ec2_instance_profile" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role = aws_iam_role.ec2_instance_profile.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = aws_iam_role.ec2_instance_profile.name
  role = aws_iam_role.ec2_instance_profile.name
}
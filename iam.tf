resource "aws_iam_role" "aws-iam-role-ssm" {
  name = "ssm-mgmt"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = {
    name = "role"
  }
}


resource "aws_iam_role_policy_attachment" "ssm-mgmt-attachment" {
  role       = aws_iam_role.aws-iam-role-ssm.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "iam-instance-profile" {
  name = "instance-profile"
  role = aws_iam_role.aws-iam-role-ssm.name
  tags = {
    name = "profile"
  }
}
#Create a policy that runs EC2
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

#SSM attachment
resource "aws_iam_role_policy_attachment" "ssm-mgmt-attachment" {
  role       = aws_iam_role.aws-iam-role-ssm.id
  policy_arn = var.ssm-mgmt-attachment.policy-arn
}

#Create instance profile to pass role information to an EC2 instance
resource "aws_iam_instance_profile" "iam-instance-profile" {
  name = "Instance-profile"
  role = aws_iam_role.aws-iam-role-ssm.name
  tags = {
    name = "profile"
  }
}
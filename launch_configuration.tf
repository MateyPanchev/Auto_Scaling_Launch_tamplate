# Create a Launch Configuration -----------------------------------------------
resource "aws_launch_template" "aws-launch-template" {
  name_prefix            = var.instance_data.name-prefix
  image_id               = var.instance_data.image-id
  instance_type          = var.instance_data.instance_type
  update_default_version = true
  tag_specifications {}
  iam_instance_profile {
    Name = aws_iam_instance_profile.iam-instance-profile.name
  }
  tags = {
    key                 = "Name"
    value               = "DevOps"
    propagate_at_launch = true
  }

  vpc_security_group_ids = [aws_security_group.allow-sec1.id]

  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    amazon-linux-extras install -y nginx1
    systemctl enable nginx --now
    EOF
  )
}
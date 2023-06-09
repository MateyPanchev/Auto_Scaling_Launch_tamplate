# Create a ASG ----------------------------------------------------------------
resource "aws_autoscaling_group" "aws-autoscaling-group" {
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.terraform-sub3-private.id, aws_subnet.terraform-sub4-private.id]
  target_group_arns   = [aws_lb_target_group.alb-target.arn]
  launch_template {
    id      = aws_launch_template.aws-launch-template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "DevOps"
  }
}

# Create Auto Scale Policy ----------------------------------------------------

resource "aws_autoscaling_policy" "aws-autoscaling-policy" {
  name                   = "Auto-scaling-policy"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.aws-autoscaling-group.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 4
}
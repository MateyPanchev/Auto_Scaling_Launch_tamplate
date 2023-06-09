# Create a Cloudwatch Alarm Scale Up
resource "aws_cloudwatch_metric_alarm" "aws-cloudwatch-metric-alarm-up" {
  alarm_name          = "This will scale up"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions = [
    aws_autoscaling_policy.aws-autoscaling-policy.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.aws-autoscaling-group.name
  }
}

# Create a Cloudwatch Alarm Policy
resource "aws_autoscaling_policy" "aws-autoscaling-policy-cloudwatch-metric-alarm-up-policy" {
  name                   = "aws-autoscaling-policy-cloudwatch-metric-alarm"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.aws-autoscaling-group.name
}

# Create a Cloudwatch Alarm Scale Down
resource "aws_cloudwatch_metric_alarm" "aws-cloudwatch-metric-alarm-down" {
  alarm_name          = "This will scale down"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 30
  alarm_description   = "This metric monitors EC2 CPU utilization for scale-down"
  alarm_actions       = [
    aws_autoscaling_policy.aws-autoscaling-policy.arn
  ]
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.aws-autoscaling-group.name
  }
}

# Create a Cloudwatch Alarm Policy
resource "aws_autoscaling_policy" "aws-autoscaling-policy-cloudwatch-metric-alarm-down-policy" {
  name                   = "scale-down-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.aws-autoscaling-group.name
}

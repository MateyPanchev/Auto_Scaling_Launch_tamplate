# Create a Cloudwatch Alarm ------------------------------------------------------
resource "aws_cloudwatch_metric_alarm" "aws-cloudwatch-metric-alarm" {
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
    AutoScalingGroupName = var.auto-scaling-group-name
  }
}

resource "aws_autoscaling_policy" "aws-autoscaling-policy-cloudwatch-metric-alarm" {
  name                   = "aws-autoscaling-policy-cloudwatch-metric-alarm"
  scaling_adjustment     = 4
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.aws-autoscaling-group.name
}
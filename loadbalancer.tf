# Create a Load Balancer
resource "aws_lb" "load-balancer" {
  name               = "load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow-http.id]
  subnets            = [aws_subnet.terraform-sub1-pub.id, aws_subnet.terraform-sub2-pub.id]

  enable_deletion_protection = false
  tags = {
    Name = "load-balancer"
  }
}

# Create a Load Balancer Target Group
resource "aws_lb_target_group" "alb-target" {
  name     = "alb-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.aws-vpc.id
}

# Create a Load Balancer Target
#resource "aws_lb_target_group_attachment" "aws-lb-target-group-attachment" {
#  target_group_arn = aws_lb_target_group.alb-target.arn
#  target_id        = aws_autoscaling_group.aws-autoscaling-group.id
#  port             = 80
#  depends_on = [aws_autoscaling_group.aws-autoscaling-group,
#    aws_lb_target_group.alb-target]
#}

# Create a Load Balancer Listener
resource "aws_lb_listener" "front-end" {
  load_balancer_arn = aws_lb.load-balancer.arn
  port              = "80"
  protocol          = "HTTP"
  tags = {
    Name = "listener"
  }
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-target.arn
  }
}

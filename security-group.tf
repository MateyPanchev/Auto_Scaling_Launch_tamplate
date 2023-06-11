# Create a Security Group
resource "aws_security_group" "allow-http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description = "HTTP from outside"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow_http"
  }
}

# Create a Security Group
resource "aws_security_group" "allow-sec1" {
  name        = "allow_sec1"
  description = "Allow HTTP inbound traffic to load"
  vpc_id      = aws_vpc.aws-vpc.id

  ingress {
    description     = "Traffic from http_sec_group"
    from_port       = 80
    to_port         = 80
    protocol        = "TCP"
    security_groups = [aws_security_group.allow-http.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow-sec1"
  }

}

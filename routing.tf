# Create 4 Routing Tables -----------------------------------------------------
resource "aws_route_table" "terraform-route-gateway" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
    tags = {
      Name = "Route-gateway"
  }
}
resource "aws_route_table" "terraform-route-gateway2" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "Route-gateway2"
  }
}

resource "aws_route_table" "route-nat" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }
  tags = {
    Name = "Route-nat"
  }
}

resource "aws_route_table" "route-nat2" {
  vpc_id = aws_vpc.aws-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway2.id
  }
  tags = {
    Name = "Route-nat-2"
  }
}

# Associate Routing Tables
resource "aws_route_table_association" "terraform-associate1" {
  subnet_id      = aws_subnet.terraform-sub1-pub.id
  route_table_id = aws_route_table.terraform-route-gateway.id
}

resource "aws_route_table_association" "terraform_associate2" {
  subnet_id      = aws_subnet.terraform-sub2-pub.id
  route_table_id = aws_route_table.terraform-route-gateway2.id
}

resource "aws_route_table_association" "terraform_associate3" {
  subnet_id      = aws_subnet.terraform-sub3-private.id
  route_table_id = aws_route_table.route-nat.id
}

resource "aws_route_table_association" "terraform_associate4" {
  subnet_id      = aws_subnet.terraform-sub4-private.id
  route_table_id = aws_route_table.route-nat2.id
}

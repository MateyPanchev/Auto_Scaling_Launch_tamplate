# Create 2 ElasticIP 
resource "aws_eip" "elastic-ip" {
  domain = "vpc"
}

resource "aws_eip" "elastic-ip2" {
  domain = "vpc"
}

# Create 2 NAT Gateway 
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic-ip.id
  subnet_id     = aws_subnet.terraform-sub1-pub.id
  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_nat_gateway" "nat-gateway2" {
  allocation_id = aws_eip.elastic-ip2.id
  subnet_id     = aws_subnet.terraform-sub2-pub.id
  tags = {
    Name = "nat-gateway2"
  }
}

# Create a IGW 
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "internet-gateway"
  }
}

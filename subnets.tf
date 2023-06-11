# Create 4 Subnets
resource "aws_subnet" "terraform-sub1-pub" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_ranges, "public1")
  availability_zone = var.availability_zone.availability_1a
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet"
  }
}

resource "aws_subnet" "terraform-sub2-pub" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_ranges, "public2")
  availability_zone = var.availability_zone.availability_1b
  tags = {
    Name = "${lookup(var.subnet_type, "public")}-subnet"
  }
}

resource "aws_subnet" "terraform-sub3-private" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_ranges, "private1")
  availability_zone = var.availability_zone.availability_1a
  tags = {
    Name = lookup(var.subnet_type, "private")
  }
}

resource "aws_subnet" "terraform-sub4-private" {
  vpc_id            = aws_vpc.aws-vpc.id
  cidr_block        = lookup(var.subnet_cidr_ranges, "private2")
  availability_zone = var.availability_zone.availability_1b
  tags = {
    Name = lookup(var.subnet_type, "private")
  }
}


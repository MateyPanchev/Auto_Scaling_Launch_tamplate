resource "aws_vpc" "aws-vpc" {
  cidr_block = var.vpc_cidr_block.cidr-range
  tags = {
    Name = var.vpc_cidr_block.Name
  }
}
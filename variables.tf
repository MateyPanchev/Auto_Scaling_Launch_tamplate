variable "subnet_type" {
  default = {
    public  = "public"
    private = "private"
  }
}

variable "subnet_cidr_ranges" {
  default = {
    public1  = "172.16.1.0/24"
    public2  = "172.16.3.0/24"
    private1 = "172.16.4.0/24"
    private2 = "172.16.5.0/24"
  }
}

variable "instance_data" {
  default = {
    name-prefix   = "DevOps"
    image-id      = "ami-0649a986224ded9da"
    instance_type = "t2.micro"
  }
}

variable "vpc_cidr_block" {
  default = {
    cidr-range = "172.16.0.0/16"
    Name = "VPC"
  }
}

variable "availability_zone" {
  default = {
    availability_1a = "eu-west-1a"
    availability_1b = "eu-west-1b"
  }
}

variable "auto-scaling-group-name" {
  default = "aws-autoscaling-group"
}

variable "ssm-mgmt-attachment" {
  default = {
    policy-arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}
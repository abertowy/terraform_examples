provider "aws" {
    region = "eu-central-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myvpc2" {
    cidr_block = "192.168.0.0/24"
}

# create vpc in advance
# in terminal : terraform import aws_vpc.myvpc2 vpc-03db7c242cd8c8929

data "aws_instance" "db_search" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbservers" {
    value = data.aws_instance.db_search.availability_zone
}
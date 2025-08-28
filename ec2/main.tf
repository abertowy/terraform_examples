provider "aws" {
    region = "eu-central-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0f439e819ba112bd7"
    instance_type = "t3.micro"
}
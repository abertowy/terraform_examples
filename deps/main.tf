provider "aws" {
    region = "eu-central-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "db" {
    ami = "ami-0f439e819ba112bd7"
    instance_type = "t3.micro"
    count = var.number_of_servers
}

resource "aws_instance" "web" {
    ami = "ami-0f439e819ba112bd7"
    instance_type = "t3.micro"

    depends_on = [ aws_instance.db ]
}
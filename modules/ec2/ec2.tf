variable "server_names" {
    type = list(string)
}

variable "ec2_name" {
    type = string
}

resource "aws_instance" "ec2" {
    ami = "ami-0f439e819ba112bd7"
    instance_type = "t3.micro"
    count = length(var.server_names)
    tags = {
        # Name = var.ec2_name
        Name = var.server_names[count.index]
    }
}

output "instance_id" {
  value = [aws_instance.ec2.*.id]
}
provider "aws" {
    region = "eu-central-1"
}

variable "vpcname" {
    type = string
    default = "myvpc"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist" {
    type = list(string)
    default = ["val_1", "val_2"]
}

variable "mymap" {
    type = map
    default = {
        Key1 = "Value_1"
        Key2 = "Value_2"
    }
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["shape", 1, "id_0001"]
}

variable "myObject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "localhost"
        port = [22, 80]
    }
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        # Name = var.vpcname
        # Name = var.mylist[0]
        # Name = var.mymap["Key1"]
        Name = var.inputname
    }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}
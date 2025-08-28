provider "aws" {
    region = "eu-central-1"
}

module "ec2_module" {
  source = "./ec2"
  ec2_name = "Name from module"
  server_names = ["mariadb","psql","mysql"]
}

output "module_output" {
  value = module.ec2_module.instance_id
}
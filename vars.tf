variable "region" {
  default = "us-east-1"
}

variable "access" {
  default = "*****************************"
}

variable "secret" {
  default = "***********************************"
}

variable "vpc_cidr" {
  type    = "string"
  default = "123.145.0.0/16"
}

variable "subnet_cidr1" {
  type    = "list"
  default = ["123.145.0.0/26", "123.145.0.64/26", "123.145.0.128/26", "123.145.0.192/26"]
}

variable "azs" {
  type    = "list"
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}

variable "vpc_name" {
  default = "CreatedByTerraform"
}

variable "rt_name" {
  default = "Terraform_rt"
}

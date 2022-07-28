module "VPC" {
  source = "github.com/dailypractice-all/tf-module-vpc"
  ENV = var.ENV
  PROJECT = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
}

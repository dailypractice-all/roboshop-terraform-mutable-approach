// MODULE VPC

module "VPC" {
  source = "github.com/dailypractice-all/tf-module-vpc"
  ENV = var.ENV
  PROJECT = var.PROJECT
  VPC_CIDR = var.VPC_CIDR
  PUBLIC_SUBNETS_CIDR = var.PUBLIC_SUBNETS_CIDR
  PRIVATE_SUBNETS_CIDR = var.PRIVATE_SUBNETS_CIDR
  AZ = var.AZ
  DEFAULT_VPC_ID = var.DEFAULT_VPC_ID
  DEFAULT_VPC_CIDR = var.DEFAULT_VPC_CIDR
  DEFAULT_VPC_RT = var.DEFAULT_VPC_RT
}

// MODULE RDS
module "RDS" {
  source             = "github.com/dailypractice-all/tf-module-rds"
  ENV                = var.ENV
  PROJECT            = var.PROJECT
  ENGINE             = var.RDS_ENGINE
  ENGINE_VERSION     = var.RDS_ENGINE_VERSION
  RDS_INSTANCE_CLASS = var.RDS_INSTANCE_CLASS
  PG_FAMILY          = var.RDS_PG_FAMILY
  PRIVATE_SUBNET_IDS = module.VPC.PRIVATE_SUBNET_IDS
  VPC_ID             = module.VPC.VPC_ID
  RDS_PORT           = var.RDS_PORT
  ALLOW_SG_CIDR      = module.VPC.PRIVATE_SUBNET_CIDR
}

// MODULE DOCDB
#module "DOCDB" {
#  source               = "github.com/dailypractice-all/tf-module-docdb"
#  ENV                  = var.ENV
#  PROJECT              = var.PROJECT
#  ENGINE               = var.DOCDB_ENGINE
#  ENGINE_VERSION       = var.DOCDB_ENGINE_VERSION
#  INSTANCE_CLASS       = var.INSTANCE_CLASS
#  PG_FAMILY            = var.DOCDB_PG_FAMILY
#  PRIVATE_SUBNET_IDS   = module.VPC.PRIVATE_SUBNET_IDS
#  VPC_ID               = module.VPC.VPC_ID
#  PORT                 = var.PORT
#  ALLOW_SG_CIDR        = module.VPC.PRIVATE_SUBNET_CIDR
}
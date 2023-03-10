# configure aws provider
provider "aws" {
  region    = var.region
  profile   = "fdelenne"
}

# create VPC for **********DEV*********
module "vpc-dev" {
  source                            = "../modules/vpc-dev"
  region                            = var.region
  project_name                      = var.project_name
  vpc_cidr                          = var.vpc_cidr
  public_subnet_dev_az1_cidr        = var.public_subnet_dev_az1_cidr_id
  public_subnet_dev_az2_cidr        = var.public_subnet_dev_az2_cidr_id
  private_app_subnet_dev_az1_cidr   = var.private_app_subnet_dev_az1_cidr_id
  private_app_subnet_dev_az2_cidr   = var.private_app_subnet_dev_az2_cidr_id
  private_data_subnet_dev_az1_cidr  = var.private_data_subnet_dev_az1_cidr_id
  private_data_subnet_dev_az2_cidr  = var.private_data_subnet_dev_az2_cidr_id
}
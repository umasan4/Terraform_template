#------------------------------
# vpc
#------------------------------
resource "aws_vpc" "<VPC_NAME>" {
  cidr_block       = var.vpc_cidr  
  instance_tenancy = var.vpc_tenancy
  tags             = { Name = var.tags_name }
}
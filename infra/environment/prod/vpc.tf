#------------------------------
# vpc
#------------------------------
module "<VPC_NAME>" {
  source      = "<MEDULE_KEY>"
  vpc_cidr    = var.vpc_cidr
  vpc_tenancy = var.vpc_tenancy
  tags_name   = "${var.project}_vpc_${var.env}"
}
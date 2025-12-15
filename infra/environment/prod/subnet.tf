#------------------------------
# subnet
#------------------------------
module "<SUBNET_NAME>" {
  source     =  "../../modules/subnet"
  for_each   = var.subnet_map
  vpc_id     = var.vpc_id
  cidr_block = each.value
  tags_name   = "${var.project}-subnet-${var.env}"
}
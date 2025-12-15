#------------------------------
# subnet
#------------------------------
module "<SUBNET_NAME>" {
  source     =  "../../modules/subnet.tf"
  for_each   = var.subnet_map
  vpc_id     = var.vpc_id
  cidr_block = each.value
  tags = { Name = var.tags_name }
}
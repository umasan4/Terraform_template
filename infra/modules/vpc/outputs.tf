#------------------------------
# vpc
#------------------------------
output "vpc_main" {
  value       = aws_vpc.main.id
  # 呼出し方法
  # moduleで vpc = module.vpc.main 
}
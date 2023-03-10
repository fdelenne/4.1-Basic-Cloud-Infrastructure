output "region" {
  value = var.region 
}

output "project_name" {
  value = var.project_name 
}

output "vpc_dev_id" {
  value = aws_vpc.vpc_dev.id
}



output "private_app_subnet_dev_az1_id" {
  value = aws_subnet.private_app_subnet_dev_az1.id
}

output "private_app_subnet_dev_az2_id" {
  value = aws_subnet.private_app_subnet_dev_az2.id
}

output "private_data_subnet_dev_az1_id" {
  value = aws_subnet.private_data_subnet_dev_az1.id
}

output "private_data_subnet_dev_az2_id" {
  value = aws_subnet.private_data_subnet_dev_az2.id
}

output "internet_gateway_dev" {
  value = aws_internet_gateway.internet_gateway_dev
}

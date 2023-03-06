resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"

  tags = {
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
    Name = "practical task"
  }
}
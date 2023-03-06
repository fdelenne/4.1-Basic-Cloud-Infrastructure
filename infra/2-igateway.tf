resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
    Name = "practical task"
  }
}
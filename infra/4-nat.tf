resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
    Name = "practical task"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = {
    Owner = "fdelenne"
    Project = "T1 -> T2 course"
    Name = "practical task"
  }

  depends_on = [aws_internet_gateway.igw]
}

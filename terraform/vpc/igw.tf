// Create Internet Gateway
resource "aws_internet_gateway" "first-igw" {
  vpc_id = aws_vpc.first-vpc.id

  tags = {
    Name = "first-igw"
  }
}
